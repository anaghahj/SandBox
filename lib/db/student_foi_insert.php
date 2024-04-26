<?php

include 'connect.php';

$USN = $_POST['USN'];
$FoI = $_POST['FoI'];
$Experience = $_POST['Experience'];


$stmt = $connect->prepare("INSERT INTO Student_FoI (USN, FoI, Experience) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $USN, $FoI, $Experience);

if ($stmt->execute()) {
    echo "Student_FoI data inserted successfully.";
} else {
    echo "Error: Student_foi data insertion failed.";
}

$stmt->close();
$connect->close();

?>