<?php
header(header: 'Content-Type: application/json'); // Always return JSON
require_once("../models/cities.php");

$city = new cities();

try {
    // ✅ Save city
    if (isset($_POST["savecity"])) {
        if (!isset($_POST['cityname'], $_POST['countryid'])) {
            echo json_encode(value: ["status" => "error", "message" => "cityname and countryid are required"]);
            exit;
        }

        $city_name = $_POST['cityname'];
        $country_id = intval(value: $_POST['countryid']);
        $response = $city->savecity(cityname: $city_name, countryid: $country_id);
        echo json_encode(value: $response);
        exit;
    }

    // ✅ Get all cities
    if (isset($_GET['getcities'])) {
        echo $city->getcities();
        exit;
    }

    // ✅ Get city details
    if (isset($_GET['getcitydetails'])) {
        if (!isset($_GET['cityid'])) {
            echo json_encode(value:["status" => "error", "message" => "cityid is required"]);
            exit;
        }

        $city_id = intval(value: $_GET['cityid']);
        echo $city->getcitydetails(cityid: $city_id);
        exit;
    }

    // ✅ Delete city
    if (isset($_POST['deletecity'])) {
        if (!isset($_POST['cityid'])) {
            echo json_encode(value: ["status" => "error", "message" => "cityid is required"]);
            exit;
        }

        $city_id = intval(value: $_POST['cityid']);
        $response = $city->deletecity(cityid: $city_id);
        echo json_encode($response);
        exit;
    }

    // ✅ No valid action provided
    echo json_encode(value: ["status" => "error", "message" => "No valid action specified"]);
    exit;

} catch (Exception $e) {
    echo json_encode(value: ["status" => "error", "message" => $e->getMessage()]);
    exit;
}
?>
