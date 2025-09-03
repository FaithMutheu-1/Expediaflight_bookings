<?php
require_once("../models/flights.php");
$flight = new flights();

// Save flight
if (isset($_POST["saveflight"])) {
    $flight_id            = $_POST['flightid'];
    $airline_id           = $_POST['airlineid'];
    $departure_airport_id = $_POST['departureairportid'];
    $arrival_airport_id   = $_POST['arrivalairportid'];
    $departure_time       = $_POST['departuretime'];
    $arrival_time         = $_POST['arrivaltime'];

    $response = $flight->saveflight(
        airlineid: $airline_id,
        departureairportid: $departure_airport_id,
        arrivalairportid: $arrival_airport_id,
        departuretime: $departure_time,
        arrivaltime: $arrival_time
    );
    echo json_encode($response);
}

// Get all flights
if (isset($_GET['getflights'])) {
    echo $flight->getflights();
}

// Get flight details
if (isset($_GET['getflightdetails'])) {
    $flight_id = $_GET['flightid'];
    echo $flight->getflightdetails(flightid: $flight_id);
}

// Delete flight
if (isset($_POST['deleteflight'])) {
    if (!isset($_POST['flightid'])) {
        echo json_encode(["status" => "error", "message" => "flightid required"]);
        exit;
    }
    $flightid = $_POST['flightid'];
    $response = $flight->deleteflight(flightid: $flightid);
    echo json_encode($response);
    exit;
}
?>
