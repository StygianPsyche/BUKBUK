<?php
header('Content-Type: application/json');
$conn = new mysqli("localhost","root","","barangayadmin_db");

$typeId = $_GET['request_type_id'] ?? 0;

$sql = "
SELECT 
  f.field_key,
  f.label,
  f.field_type,
  f.is_required
FROM request_type_fields rtf
JOIN form_fields f ON rtf.field_id = f.id
WHERE rtf.request_type_id = ?
ORDER BY rtf.field_order ASC
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $typeId);
$stmt->execute();
$result = $stmt->get_result();

$fields = [];
while ($row = $result->fetch_assoc()) {
  $fields[] = $row;
}

echo json_encode($fields);
