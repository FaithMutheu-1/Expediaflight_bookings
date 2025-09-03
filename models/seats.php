<?php
require_once("db.php");

class seats extends db {

    function checkseat($flightid, $seatnumber) {
        $sql = "CALL `sp_checkseat`({$flightid}, '{$seatnumber}')";
        return $this->getData($sql)->rowCount();
    }

    function saveseat($seatid, $flightid, $seatnumber, $classid, $isavailable) {
        $sql = "CALL `sp_saveseats`({$seatid}, {$flightid}, '{$seatnumber}', {$classid}, {$isavailable})";
        $this->getData($sql);
        return ["status" => "success", "message" => "seat saved successfully"];
    }

    function getseats() {
        $sql = "CALL `sp_getseats`()";
        return $this->getJSON($sql);
    }

    function getseatdetails($seatid) {
        $sql = "CALL `sp_getseatdetails`({$seatid})";
        return $this->getJSON($sql);
    }

    function deleteseat($seatid) {
        $sql = "CALL `sp_deleteseats`({$seatid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the seat was deleted successfully"];
    }
}
?>
