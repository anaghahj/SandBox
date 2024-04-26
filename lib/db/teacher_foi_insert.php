<?php

include 'connect.php';

$Teacher_id = $_POST['Teacher_id'];
$FoI = $_POST['FoI'];
$Experience = $_POST['Experience'];


$stmt = $connect->prepare("INSERT INTO Teacher_FoI (Teacher_id, FoI, Experience) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $Teacher_id, $FoI, $Experience);

if ($stmt->execute()) {
    echo "Teacher_foi data inserted successfully.";
} else {
    echo "Error: Teacher_foi data insertion failed.";
}

$stmt->close();
$connect->close();

?>