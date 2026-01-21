document.addEventListener("DOMContentLoaded", function () {
  const select = document.getElementById("requestTypeSelect");
  const formContainer = document.getElementById("formContainer");

  if (!select) {
    console.error("❌ Select not found");
    return;
  }

  // ✅ ADDED — DO NOT REMOVE ANYTHING ELSE
  document.querySelectorAll('input[name="hasId"]').forEach(radio => {
    radio.addEventListener('change', () => {
      document.getElementById('nextBtn').disabled = false;
    });
  });

  const nextBtn = document.getElementById("nextBtn");
  const idCard = document.querySelector(".id-card");

  nextBtn.addEventListener("click", () => {
    const selected = document.querySelector('input[name="hasId"]:checked');
    if (!selected) return;

    if (selected.value === "yes") {
      idCard.innerHTML = `
      <div class="text-center">
        <button class="btn btn-primary btn-lg" id="scanBtn">
          📷 Scan ID
        </button>
      </div>
    `;
    }

    if (selected.value === "no") {
      idCard.style.display = "none";
    }
  });


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



function submitRequestToSQL() {
  const formEl = window._pendingForm;
  if (!formEl) {
    console.error("❌ No pending form");
    return;
  }

  const formData = new FormData(formEl);

  formData.append(
    "request_type_id",
    document.getElementById("requestTypeSelect").value
  );

  fetch("../api/submit_request.php", {
    method: "POST",
    body: formData
  })
    .then(res => res.json())
    .then(data => {
      console.log("✅ SQL response:", data);

      if (!data.success) {
        alert(data.message || "Insert failed");
        return;
      }

      showSummary(formEl, data.ref_number);
    })
    .catch(err => {
      console.error("❌ Insert error:", err);
      alert("Failed to submit request");
    });
}

const confirmYes = document.getElementById("confirmYes");

if (confirmYes) {
  confirmYes.addEventListener("click", () => {
    submitRequestToSQL();
  });
}