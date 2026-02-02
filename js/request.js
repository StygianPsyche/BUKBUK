// ✅ ADD THIS (language read) — very top of file
const kioskLang = localStorage.getItem("kioskLanguage") || "en";

document.addEventListener("DOMContentLoaded", function () {

  // ✅ ADD THIS (apply language on load)
  if (typeof kioskTranslations !== "undefined") {
    applyRequestLanguage(kioskLang);
  }

  const idModalEl = document.getElementById("idPromptModal");
  const idModal = new bootstrap.Modal(idModalEl);
// autofill.js

  // Show modal immediately on page load
  idModal.show();

  document.getElementById("idYesBtn").addEventListener("click", () => {
    sessionStorage.setItem("hasValidId", "yes");
    idModal.hide();
  });

  document.getElementById("idNoBtn").addEventListener("click", () => {
    sessionStorage.setItem("hasValidId", "no");
    idModal.hide();
  });

  const select = document.getElementById("requestTypeSelect");
  const formContainer = document.getElementById("formContainer");

  if (!select) {
    console.error("❌ Select not found");
    return;
  }

  fetch("../api/request_types.php")
    .then(response => response.json())
    .then(data => {
      console.log("✅ Loaded request types:", data);

      select.innerHTML = '<option value="">-- Select Request Type --</option>';

      data.forEach(item => {
        const option = document.createElement("option");
        option.value = item.id;
        option.textContent = item.name;
        select.appendChild(option);
      });
    })
    .catch(error => {
      console.error("❌ Failed to load request types", error);
    });

  select.addEventListener("change", () => {
    const requestTypeId = select.value;

    if (!requestTypeId) {
      formContainer.innerHTML = "";
      formContainer.style.display = "none";
      console.log("🧹 No request selected, form hidden");
      return;
    }

    formContainer.style.display = "block";
    formContainer.innerHTML = "";

    console.log("📌 Selected request type ID:", requestTypeId);

    fetch(`../api/get_request_fields.php?request_type_id=${requestTypeId}`)
      .then(res => res.json())
      .then(fields => {
        console.log("📦 Fields for kiosk:", fields);
        renderDynamicKioskForm(fields);
      })
      .catch(err => {
        console.error("❌ Failed to load fields", err);
      });
  });
});


// ✅ ADD THIS (language application) — bottom of file
function applyRequestLanguage(lang) {
  const t = kioskTranslations[lang];
  if (!t) return;

  document.querySelector("h5.fw-bold").textContent = t.requestTypes;
  document.getElementById("requestTypeSelect").options[0].textContent = t.selectRequest;
  document.getElementById("backBtn").textContent = t.back;

  document.querySelector("#confirmModal .modal-title").textContent = t.confirmTitle;
  document.querySelector("#confirmModal .modal-body").textContent = t.confirmText;
  document.getElementById("confirmYes").textContent = t.yes;
  document.getElementById("confirmNo").textContent = t.no;

  document.querySelector("#summaryModal .modal-title").textContent = t.submissionSummary;
  document.getElementById("printReceiptBtn").textContent = t.print;

  document.querySelector("#idPromptModal .modal-title").textContent = t.beforeContinue;
  document.querySelector("#idPromptModal p").textContent = t.haveId;
  document.getElementById("idYesBtn").textContent = t.yes;
  document.getElementById("idNoBtn").textContent = t.no;

  document.querySelector("#cameraModal .modal-title").textContent = t.scanId;
  document.querySelector("#cameraModal .btn-secondary").textContent = t.cancel;
}
