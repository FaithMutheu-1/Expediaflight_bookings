<?php
require_once("db.php");

class flights extends db {

    function checkflight($airlineid, $departureairportid, $arrivalairportid, $departuretime) {
        $sql = "CALL `sp_checkflight`({$airlineid}, {$departureairportid}, {$arrivalairportid}, '{$departuretime}')";
        return $this->getData($sql)->rowCount();
    }

    function saveflight($airlineid, $departureairportid, $arrivalairportid, $departuretime, $arrivaltime) {
        $sql = "CALL `sp_saveflight`({$airlineid}, {$departureairportid}, {$arrivalairportid}, '{$departuretime}', '{$arrivaltime}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "flight saved successfully"];
    }

    function getflights() {
        $sql = "CALL `sp_getflights`()";
        return $this->getJSON($sql);
    }

    function getflightdetails($flightid) {
        $sql = "CALL `sp_getflightdetails`({$flightid})";
        return $this->getJSON($sql);
    }

    function deleteflight($flightid) {
        $sql = "CALL `sp_deleteflight`({$flightid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the flight was deleted successfully"];
    }
}
?>
