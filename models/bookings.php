<?php
require_once("db.php");

class bookings extends db {

    function checkbooking($passengerid, $flightid, $seatid) {
        $sql = "CALL `sp_checkbooking`({$passengerid}, {$flightid}, {$seatid})";
        return $this->getData($sql)->rowCount();
    }

    function savebooking($passengerid, $flightid, $seatid, $bookingdate, $status) {
        $sql = "CALL `sp_savebooking`({$passengerid}, {$flightid}, {$seatid}, '{$bookingdate}', '{$status}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "booking saved successfully"];
    }

    function getbookings() {
        $sql = "CALL `sp_getbookings`()";
        return $this->getJSON($sql);
    }

    function getbookingdetails($bookingid) {
        $sql = "CALL `sp_getbookingdetails`({$bookingid})";
        return $this->getJSON($sql);
    }

    function deletebooking($bookingid) {
        $sql = "CALL `sp_deletebookings`({$bookingid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the booking was deleted successfully"];
    }
}
?>
