<?php
require_once("db.php");

class airlines extends db {

    function checkairline($airlinename) {
        $sql = "CALL `sp_checkairline`('{$airlinename}')";
        return $this->getData($sql)->rowCount();
    }

    function saveairline($airlinename) {
        $sql = "CALL `sp_saveairline`('{$airlinename}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "airline saved successfully"];
    }

    function getairlines() {
        $sql = "CALL `sp_getairlines`()";
        return $this->getJSON($sql);
    }

    function getairlinedetails($airlineid) {
        $sql = "CALL `sp_getairlinedetails`({$airlineid})";
        return $this->getJSON($sql);
    }

    function deleteairline($airlineid) {
        $sql = "CALL `sp_deleteairline`({$airlineid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the airline was deleted successfully"];
    }
}
?>
