document.addEventListener("DOMContentLoaded", () => {
  const idYesBtn = document.getElementById("idYesBtn")
  const idPromptModalEl = document.getElementById("idPromptModal")
  const cameraModalEl = document.getElementById("cameraModal")
  const video = document.getElementById("idCamera")

  if (!idYesBtn || !cameraModalEl || !video) return

  let stream = null

  const cameraModal = new bootstrap.Modal(cameraModalEl)
  const idPromptModal = bootstrap.Modal.getOrCreateInstance(idPromptModalEl)

  async function openCamera() {
    if (stream) return
    stream = await navigator.mediaDevices.getUserMedia({
      video: { facingMode: "environment" },
      audio: false
    })
    video.srcObject = stream
    await video.play()
  }

  function closeCamera() {
    if (!stream) return
    stream.getTracks().forEach(t => t.stop())
    stream = null
    video.srcObject = null
  }

  idYesBtn.addEventListener("click", async () => {
    try {
      await openCamera()
      idPromptModal.hide()
      cameraModal.show()
    } catch {
      alert("Camera unavailable")
    }
  })

  cameraModalEl.addEventListener("hidden.bs.modal", () => {
    closeCamera()
  })

  window.captureScan = async function () {
    if (!stream) return

    const canvas = document.createElement("canvas")
    canvas.width = video.videoWidth
    canvas.height = video.videoHeight
    canvas.getContext("2d").drawImage(video, 0, 0)

    const base64 = canvas.toDataURL("image/jpeg")

    const res = await fetch("/scan", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ image: base64 })
    })

    const data = await res.json()
    window.scannedData = data.result || {}
    cameraModal.hide()
  }
})
