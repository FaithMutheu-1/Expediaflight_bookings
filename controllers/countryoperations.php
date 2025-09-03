<?php
require_once("../models/countries.php");
$country= new country();
if(isset($_POST["savecountry"])){
    $country_id=$_POST['countryid'];
    $country_name=$_POST['countryname'];
    $response= $country->savecountry(countryid:$country_id, countryname:$country_name);
    echo json_encode($response);
}

if(isset($_GET['getcountries'])){
  echo $country->getcountries();

}

if(isset($_GET['getcountrydetails'])){
    $country_id=$_GET['countryid'];
    echo $country->getcountrydetails(countryid:$country_id);
}

if (isset($_POST['deletecountry'])) {
    if (!isset($_POST['countryid'])) {
        echo json_encode(value:["status" => "error", "message" => "countryid required"]);
        exit;
    }
    $countryid = $_POST['countryid'];
    $response = $country->deletecountry(countryid:$countryid);
    echo json_encode(value:$response);
    exit;
}

?>