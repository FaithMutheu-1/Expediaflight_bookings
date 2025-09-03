<?php
require_once("db.php");

class FlightBookings extends db {
    function saveflightbooking($bookingid, $flightid, $passengerid, $seatid, $bookingdate, $status) {
        $sql = "CALL `sp_saveflightbooking`({$bookingid}, {$flightid}, {$passengerid}, {$seatid}, '{$bookingdate}', '{$status}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight booking saved successfully"];
    }

    function getflightbookings(): bool|string {
        $sql = "CALL `sp_getflightbookings`()";
        return $this->getJSON($sql);
    }

    function getflightbookingdetails($bookingid): bool|string {
        $sql = "CALL `sp_getflightbookingdetails`({$bookingid})";
        return $this->getJSON(sql: $sql);
    }

    function deleteflightbooking($bookingid) {
        $sql = "CALL `sp_deleteflightbooking`({$bookingid})";
        $result = $this->getData(sql: $sql);

        if ($result && $result->rowCount() > 0) {
            return ["status" => "success", "message" => "Flight booking deleted successfully"];
        } else {
            return ["status" => "error", "message" => "Booking not found or could not be deleted"];
        }
    }
}
