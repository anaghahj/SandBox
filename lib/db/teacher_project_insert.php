<?php

include 'connect.php';

$Teacher_id = $_POST['Teacher_id'];
$Project_name = $_POST['Project_name'];


$stmt = $connect->prepare("INSERT INTO Teacher_projects (Teacher_id, Project_name) VALUES (?, ?)");
$stmt->bind_param("ss", $Teacher_id, $Project_name);

if ($stmt->execute()) {
    echo "Teacher_projects data inserted successfully.";
} else {
    echo "Error: Teacher_projects data insertion failed.";
}

$stmt->close();
$connect->close();

?>