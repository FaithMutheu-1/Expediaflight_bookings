<?php
require_once("db.php");

class airports extends db {

    function checkairport($airportname, $cityid) {
        $sql = "CALL `sp_checkairport`('{$airportname}', {$cityid})";
        return $this->getData($sql)->rowCount();
    }

    function saveairport($airportname, $cityid) {
        $sql = "CALL `sp_saveairport`('{$airportname}', {$cityid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "airport saved successfully"];
    }

    function getairports() {
        $sql = "CALL `sp_getairports`()";
        return $this->getJSON($sql);
    }

    function getairportdetails($airportid) {
        $sql = "CALL `sp_getairportdetails`({$airportid})";
        return $this->getJSON($sql);
    }

    function deleteairport($airportid) {
        $sql = "CALL `sp_deleteairport`({$airportid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the airport was deleted successfully"];
    }
}
?>
