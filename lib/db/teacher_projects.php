<?php
include 'connect.php';

if(isset($_POST["Teacher_id"])) {
    $Teacher_id = $_POST["Teacher_id"];

    $stmt = $connect->prepare("select Project_name from teacher_projects WHERE Teacher_id = ?");
    $stmt->bind_param("s",$Teacher_id);
    $stmt->execute();
    
    $result = $stmt->get_result();
    
    $data = array();
    
    while ($row = $result->fetch_assoc()) {
         $data[] = $row;
    }
    
    
    echo json_encode($data);
} else {

    echo "Error: USN not provided. $USN";
$stmt->close();
}


$connect->close();
?>
