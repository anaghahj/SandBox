<?php
include 'connect.php';

$queryResult=$connect->query("select Usn,Name,Department,Semester,Section,CGPA from Student;");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>