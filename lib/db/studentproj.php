<?php
include 'connect.php';

if(isset($_POST["USN"])) {
    $USN = $_POST["USN"];

    $stmt = $connect->prepare("SELECT Foi, Experience FROM Student_foi WHERE Usn = ?");
    $stmt->bind_param("s", $USN);
    $stmt->execute();
    
    $result = $stmt->get_result();
    
    // Initialize an empty array to store the results
    $data = array();
    
    while ($row = $result->fetch_assoc()) {
        // Append each row to the data array
        $data[] = $row;
    }
    
    // Encode the entire data array as JSON
    echo json_encode($data);
} else {

    echo "Error: USN not provided. $USN";
$stmt->close();
}


$connect->close();
?>
