const micBtn = document.getElementById("micToggleBtn")

if (micBtn) {
  micBtn.addEventListener("click", () => {
    console.log("Mic / TTS triggered")
  })
}
