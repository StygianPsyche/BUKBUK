// stt.js
// Speech-to-text correction for scanned + autofilled forms

const micBtn = document.getElementById("micToggleBtn")

let listening = false
let recorder = null
let chunks = []

if (micBtn) {
  micBtn.addEventListener("click", async () => {
    // STOP LISTENING
    if (listening) {
      recorder.stop()
      micBtn.textContent = "🎤 Start Listening"
      listening = false
      return
    }

    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      recorder = new MediaRecorder(stream)
      chunks = []

      recorder.ondataavailable = e => chunks.push(e.data)

      recorder.onstop = async () => {
        const blob = new Blob(chunks, { type: "audio/webm" })
        const reader = new FileReader()

        reader.onloadend = async () => {
          try {
            const audio = reader.result.split(",")[1]

            console.log("🟢 STT audio captured")

            // 1. Speech to text
            const sttRes = await fetch(
              "https://backend-production-79ea.up.railway.app/stt",
              {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ audio })
              }
            )

            const { text } = await sttRes.json()
            console.log("🟢 Transcript:", text)

            if (!text) return

            // 2. Collect current form state
            const form = document.getElementById("activeForm")
            const current = {}

            if (form) {
              form.querySelectorAll("input, textarea, select").forEach(el => {
                if (!el.id) return

                if (el.type === "radio") {
                  if (el.checked) current[el.id] = el.value
                } else {
                  current[el.id] = el.value
                }
              })
            }

            console.log("🟢 Current form values:", current)

            // 3. Send transcript + current data for correction
            const fixRes = await fetch(
              "https://backend-production-79ea.up.railway.app/correct",
              {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                  transcript: text,
                  current
                })
              }
            )

            const { result } = await fixRes.json()
            console.log("🟢 Corrections:", result)

            if (!form || !result || Object.keys(result).length === 0) return

            // 4. Apply corrections to form
            Object.entries(result).forEach(([key, value]) => {
              if (value == null) return

              const input = form.querySelector(`#${key}`)
              if (!input) return

              // Normalize sex values
              if (key === "sex") {
                if (value === "M") value = "Male"
                if (value === "F") value = "Female"
              }

              if (input.type === "radio") {
                const radio = form.querySelector(
                  `input[name="${input.name}"][value="${value}"]`
                )
                if (radio) radio.checked = true
              } else {
                input.value = value
              }

              input.dispatchEvent(new Event("input", { bubbles: true }))
              input.dispatchEvent(new Event("change", { bubbles: true }))
            })

            // 5. Sync corrected values back to scannedData
            if (window.scannedData) {
              Object.assign(window.scannedData, result)
            }

          } catch (err) {
            console.error("❌ STT correction failed:", err)
          }
        }

        reader.readAsDataURL(blob)
      }

      recorder.start()
      micBtn.textContent = "🛑 Stop Listening"
      listening = true

    } catch (err) {
      console.error("❌ Microphone access error:", err)
    }
  })
}
