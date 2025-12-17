document.addEventListener("DOMContentLoaded", function () {
  const select = document.getElementById("requestTypeSelect");

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
        option.value = item.slug;   // or item.id
        option.textContent = item.name;
        select.appendChild(option);
      });
    })
    .catch(error => {
      console.error("❌ Failed to load request types", error);
    });
});
