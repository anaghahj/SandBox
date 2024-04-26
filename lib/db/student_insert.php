<?php

include 'connect.php';

$USN = $_POST['USN'];
$Name = $_POST['Name'];
$Semester = $_POST['Semester'];
$Section = $_POST['Section'];
$Department = $_POST['Department'];
$CGPA = $_POST['CGPA'];

$stmt = $connect->prepare("INSERT INTO Student (USN, Name, Semester, Section, Department, CGPA) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssissd", $USN, $Name, $Semester, $Section, $Department, $CGPA);

if ($stmt->execute()) {
    echo "Student data inserted successfully.";
} else {
    echo "Error: Student data insertion failed.";
}

$stmt->close();
$connect->close();

?>