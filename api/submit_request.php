<?php
header('Content-Type: application/json');

$conn = new mysqli("153.92.15.84","u279021732_brgyugong","Ds#XH1I#t","u279021732_brgyugong");

if ($conn->connect_error) {
  http_response_code(500);
  echo json_encode(["success" => false, "message" => "DB connection failed"]);
  exit;
}

// Read JSON
$data = json_decode(file_get_contents("php://input"), true);

if (!$data || !isset($data['type_id'], $data['fields'])) {
  http_response_code(400);
  echo json_encode(["success" => false, "message" => "Invalid payload"]);
  exit;
}

$typeId = (int)$data['type_id'];
$fields = $data['fields'];

// Generate reference number
$refNumber = strtoupper(substr(uniqid("REQ"), -10));

// Insert into requests table
$stmt = $conn->prepare("
  INSERT INTO requests (ref_number, type_id, status)
  VALUES (?, ?, 'on_queue')
");
$stmt->bind_param("si", $refNumber, $typeId);

if (!$stmt->execute()) {
  http_response_code(500);
  echo json_encode(["success" => false, "message" => "Failed to insert request"]);
  exit;
}

$requestId = $stmt->insert_id;
$stmt->close();


// Insert form values
$stmt = $conn->prepare("
  INSERT INTO request_form_values (request_id, field_key, field_value)
  VALUES (?, ?, ?)
");

foreach ($fields as $key => $value) {
  if (is_array($value)) {
    $value = implode(", ", $value); // for checkboxes
  }

  $stmt->bind_param("iss", $requestId, $key, $value);
  $stmt->execute();
}

$stmt->close();