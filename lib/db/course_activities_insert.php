<?php

include 'connect.php';

$USN = $_POST['USN'];
$Name = $_POST['Name'];
$Type = $_POST['Type'];
$Date_start = $_POST['Date_start'];
$Date_end = $_POST['Date_end'];


$stmt = $connect->prepare("INSERT INTO Course_Activities (USN,Name,Type,Date_start,Date_end) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("sssss", $USN, $Name, $Type,$Date_start,$Date_end);

if ($stmt->execute()) {
    echo "Teacher_foi data inserted successfully.";
} else {
    echo "Error: Teacher_foi data insertion failed.";
}

$stmt->close();
$connect->close();

?>