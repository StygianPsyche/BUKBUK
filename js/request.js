document.addEventListener("DOMContentLoaded", function () {

  const idModalEl = document.getElementById("idPromptModal");
  const idModal = new bootstrap.Modal(idModalEl);

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

    // ❌ No request selected → hide form
    if (!requestTypeId) {
      formContainer.innerHTML = "";
      formContainer.style.display = "none";
      console.log("🧹 No request selected, form hidden");
      return;
    }

    // ✅ Request selected → show form
    formContainer.style.display = "block";
    formContainer.innerHTML = ""; // clear previous form

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
