
<?php
include 'connect.php';

if(isset($_POST["USN"])) {
    $USN = $_POST["USN"];

    $stmt = $connect->prepare("select Type, Name, Date_start, Date_end from course_activities WHERE Usn = ?");
    $stmt->bind_param("s", $USN);
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
