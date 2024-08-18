<?php
$servername = "localhost";
$username = "naresh"; // Replace with your MySQL username
$password = "naresh0969"; // Replace with your MySQL password
$dbname = "hallticket"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $name = $_POST['uname'];
    $father=$_POST['ufather'];
    $course=$_POST['course'];
    $phone=$_POST['uph'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO applications(name, father,course,phone) VALUES (?,?,?,?)");
    $stmt->bind_param("ss", $name, $father,$course,$phone);

    // Execute the statement
    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close the statement and connection
    $stmt->close();
}

$conn->close();
?>
