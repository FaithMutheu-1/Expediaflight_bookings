<?php
require_once("../models/passengers.php");
$passenger = new passengers();

// Save passenger
if (isset($_POST["savepassenger"])) {
    $passenger_id = $_POST['passengerid'];
    $first_name   = $_POST['firstname'];
    $last_name    = $_POST['lastname'];
    $email        = $_POST['email'];
    $phone        = $_POST['phone'];

    $response = $passenger->savepassenger(
        passengerid: $passenger_id,
        firstname: $first_name,
        lastname: $last_name,
        email: $email,
        phone: $phone
    );
    echo json_encode($response);
}

// Get all passengers
if (isset($_GET['getpassengers'])) {
    echo $passenger->getpassengers();
}

// Get passenger details
if (isset($_GET['getpassengerdetails'])) {
    $passenger_id = $_GET['passengerid'];
    echo $passenger->getpassengerdetails(passengerid: $passenger_id);
}

// Delete passenger
if (isset($_POST['deletepassenger'])) {
    if (!isset($_POST['passengerid'])) {
        echo json_encode(["status" => "error", "message" => "passengerid required"]);
        exit;
    }
    $passengerid = $_POST['passengerid'];
    $response    = $passenger->deletepassenger(passengerid: $passengerid);
    echo json_encode($response);
    exit;
}
?>
