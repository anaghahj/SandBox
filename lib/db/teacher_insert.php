<?php

include 'connect.php';

$Teacher_id = $_POST['Teacher_id'];
$Name = $_POST['Name'];
$Department = $_POST['Department'];
$Phone = $_POST['Phone'];

// Use prepared statements to prevent SQL injection
$stmt = $connect->prepare("INSERT INTO Teacher (Teacher_id, Name, Department, Phone) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $Teacher_id, $Name, $Department, $Phone);

if ($stmt->execute()) {
    echo "Teacher data inserted successfully.";
} else {
    echo "Error: Teacher data insertion failed.";
}

$stmt->close();
$connect->close();

?>