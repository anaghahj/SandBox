<?php
include 'connect.php';

$queryResult=$connect->query("select Teacher_id, Name,Department,Phone from Teacher");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>