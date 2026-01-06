<?php
header("Content-Type: application/json");

$conn = new mysqli("153.92.15.84","u279021732_brgyugong","Ds#XH1I#t","u279021732_brgyugong");

if ($conn->connect_error) {
  echo json_encode([
    "success" => false,
    "message" => "Database connection failed"
  ]);
  exit;
}

// from kiosk
$typeId = $_POST['request_type_id'] ?? null;

if (!$typeId) {
  echo json_encode([
    "success" => false,
    "message" => "Missing request type"
  ]);
  exit;
}

// kiosk has no logged-in citizen
$citizenId = null;

// generate reference number
$refNumber = strtoupper(bin2hex(random_bytes(4)));

// defaults
$status = "pending";
$isViewed = 0;
$formPath = null;

$stmt = $conn->prepare("
  INSERT INTO requests
  (ref_number, citizen_id, type_id, status, is_viewed, form_path, requested_at, updated_at)
  VALUES (?, NULL, ?, ?, ?, ?, NOW(), NOW())
");

$citizenId = 0;

$stmt->bind_param(
  "siisis",
  $refNumber,
  $citizenId,
  $typeId,
  $status,
  $isViewed,
  $formPath
);

if (!$stmt) {
  echo json_encode([
    "success" => false,
    "message" => $conn->error
  ]);
  exit;
}

$stmt->execute();

if (!$stmt->exec) {
  echo json_encode([
    "success" => false,
    "message" => $stmt->error
  ]);
  exit;
}

if ($stmt->affected_rows <= 0) {
  echo json_encode([
    "success" => false,
    "message" => "Insert failed"
  ]);
  exit;
}

echo json_encode([
  "success" => true,
  "ref_number" => $refNumber
]);
