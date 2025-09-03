<?php
require_once("../models/airlines.php");
$airline = new airlines();

// Save airline
if (isset($_POST["saveairline"])) {
    $airline_id   = $_POST['airlineid'];
    $airline_name = $_POST['airlinename'];
    $country_id   = $_POST['countryid'];

    $response = $airline->saveairline(airlinename: [
        'airline_id'   => $airline_id,
        'airline_name' => $airline_name,
        'country_id'   => $country_id
    ]);
    echo json_encode(value: $response);
}

// Get all airlines
if (isset($_GET['getairlines'])) {
    echo $airline->getairlines();
}

// Get airline details
if (isset($_GET['getairlinedetails'])) {
    $airline_id = $_GET['airlineid'];
    echo $airline->getairlinedetails(airlineid: $airline_id);
}

// Delete airline
if (isset($_POST['deleteairline'])) {
    if (!isset($_POST['airlineid'])) {
        echo json_encode(value: ["status" => "error", "message" => "airlineid required"]);
        exit;
    }
    $airlineid = $_POST['airlineid'];
    $response  = $airline->deleteairline(airlineid: $airlineid);
    echo json_encode(value: $response);
    exit;
}
?>
