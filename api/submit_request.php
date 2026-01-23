<?php
ini_set('display_errors', 0);
error_reporting(0);
header("Content-Type: application/json");

// header("Content-Type: application/json");
// error_reporting(E_ALL);
// ini_set('display_errors', 1);

$conn = new mysqli(
  "153.92.15.84",
  "u279021732_brgyugong",
  "Ds#XH1I#t",
  "u279021732_brgyugong"
);

if ($conn->connect_error) {
  echo json_encode(["success" => false, "message" => "DB connection failed"]);
  exit;
}

$typeId = $_POST['request_type_id'] ?? null;
if (!$typeId) {
  echo json_encode(["success" => false, "message" => "Missing request type"]);
  exit;
}

$citizenId = 1; // TEMP kiosk user
$refNumber = strtoupper(bin2hex(random_bytes(4)));
$status = "pending";
$isViewed = 0;
$formPath = null;

$stmt = $conn->prepare("
  INSERT INTO requests
  (ref_number, citizen_id, type_id, status, is_viewed, form_path, requested_at, updated_at)
  VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())
");

$stmt->bind_param(
  "siisis",
  $refNumber,
  $citizenId,
  $typeId,
  $status,
  $isViewed,
  $formPath
);

if (!$stmt->execute()) {
  echo json_encode([
    "success" => false,
    "message" => $stmt->error
  ]);
  exit;
}

echo json_encode([
  "success" => true,
  "ref_number" => $refNumber
]);
