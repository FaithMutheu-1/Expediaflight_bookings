<?php
require_once("../models/flight_classes.php");
$flightclass = new flight_classes();

// Save flight class
if (isset($_POST["saveflightclass"])) {
    $class_id   = $_POST['classid'];
    $class_name = $_POST['classname'];

    $response = $flightclass->saveclass(
        classid: $class_id,
        classname: $class_name
    );
    echo json_encode($response);
}

// Get all flight classes
if (isset($_GET['getflightclasses'])) {
    echo $flightclass->getclasses();
}

// Get flight class details
if (isset($_GET['getflightclassdetails'])) {
    $class_id = $_GET['classid'];
    echo $flightclass->getclassdetails(classid: $class_id);
}

// Delete flight class
if (isset($_POST['deleteflightclass'])) {
    if (!isset($_POST['classid'])) {
        echo json_encode(["status" => "error", "message" => "classid required"]);
        exit;
    }
    $classid = $_POST['classid'];
    $response  = $flightclass->deleteclass(classid: $classid);
    echo json_encode($response);
    exit;
}
?>
