<?php
require_once("../models/airports.php");
$airport = new airports();

// Save airport
if (isset($_POST["saveairport"])) {
    $airport_id   = $_POST['airportid'];
    $airport_name = $_POST['airportname'];
    $city_id      = $_POST['cityid'];

    $response = $airport->saveairport(
        airportname: $airport_id,
        cityid: $airport_name
    );
    echo json_encode(value: $response);
}

// Get all airports
if (isset($_GET['getairports'])) {
    echo $airport->getairports();
}

// Get airport details
if (isset($_GET['getairportdetails'])) {
    $airport_id = $_GET['airportid'];
    echo $airport->getairportdetails(airportid: $airport_id);
}

// Delete airport
if (isset($_POST['deleteairport'])) {
    if (!isset($_POST['airportid'])) {
        echo json_encode(value: ["status" => "error", "message" => "airportid required"]);
        exit;
    }
    $airportid = $_POST['airportid'];
    $response  = $airport->deleteairport(airportid: $airportid);
    echo json_encode(value: $response);
    exit;
}
?>
