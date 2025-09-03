<?php
require_once("../models/seats.php");
$seat = new seats();

// Save seat
if (isset($_POST["saveseat"])) {
    $seat_id     = $_POST['seatid'];
    $flight_id   = $_POST['flightid'];
    $seat_number = $_POST['seatnumber'];
    $class_id    = $_POST['classid'];
    $is_available = $_POST['isavailable'];

    $response = $seat->saveseat(
        seatid: $seat_id,
        flightid: $flight_id,
        seatnumber: $seat_number,
        classid: $class_id,
        isavailable: $is_available
    );
    echo json_encode($response);
}

// Get all seats
if (isset($_GET['getseats'])) {
    echo $seat->getseats();
}

// Get seat details
if (isset($_GET['getseatdetails'])) {
    $seat_id = $_GET['seatid'];
    echo $seat->getseatdetails(seatid: $seat_id);
}

// Delete seat
if (isset($_POST['deleteseat'])) {
    if (!isset($_POST['seatid'])) {
        echo json_encode(["status" => "error", "message" => "seatid required"]);
        exit;
    }
    $seatid = $_POST['seatid'];
    $response = $seat->deleteseat(seatid: $seatid);
    echo json_encode($response);
    exit;
}
?>
