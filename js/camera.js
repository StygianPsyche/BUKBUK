document.addEventListener("DOMContentLoaded", () => {
  const idYesBtn = document.getElementById("idYesBtn")
  const idPromptModalEl = document.getElementById("idPromptModal")
  const cameraModalEl = document.getElementById("cameraModal")
  const video = document.getElementById("idCamera")

  if (!idYesBtn || !cameraModalEl || !video) return

  let stream = null

  const cameraModal = new bootstrap.Modal(cameraModalEl)
  const idPromptModal = bootstrap.Modal.getOrCreateInstance(idPromptModalEl)

  idYesBtn.addEventListener("click", async () => {
    try {
      stream = await navigator.mediaDevices.getUserMedia({
        video: { facingMode: "environment" },
        audio: false
      })

      video.srcObject = stream
      idPromptModal.hide()
      cameraModal.show()
    } catch (error) {
      console.error("Unable to access camera", error)
    }
  })

  cameraModalEl.addEventListener("hidden.bs.modal", () => {
    if (stream) {
      stream.getTracks().forEach(track => track.stop())
      stream = null
      video.srcObject = null
    }
  })
})
