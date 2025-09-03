<?php
require_once("db.php");

class flight_bookings extends db {

    function checkflightbooking($bookingid, $flightid) {
        $sql = "CALL `sp_checkflightbooking`({$bookingid}, {$flightid})";
        return $this->getData($sql)->rowCount();
    }

    function saveflightbooking($bookingid, $flightid) {
        $sql = "CALL `sp_saveflightbooking`({$bookingid}, {$flightid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "flight booking saved successfully"];
    }

    function getflightbookings() {
        $sql = "CALL `sp_getflightbookings`()";
        return $this->getJSON($sql);
    }

    function getflightbookingdetails($fbid) {
        $sql = "CALL `sp_getflightbookingdetails`({$fbid})";
        return $this->getJSON($sql);
    }

    function deleteflightbooking($fbid) {
        $sql = "CALL `sp_deleteflightbooking`({$fbid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the flight booking was deleted successfully"];
    }
}
?>
