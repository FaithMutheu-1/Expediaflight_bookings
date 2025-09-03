<?php
require_once("db.php");

class flight_classes extends db {

    function checkclass($classname) {
        $sql = "CALL `sp_checkflightclass`('{$classname}')";
        return $this->getData($sql)->rowCount();
    }

    function saveclass($classid, $classname) {
        $sql = "CALL `sp_saveflightclasses`({$classid}, '{$classname}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "flight class saved successfully"];
    }

    function getclasses() {
        $sql = "CALL `sp_getflightclasses`()";
        return $this->getJSON($sql);
    }

    function getclassdetails($classid) {
        $sql = "CALL `sp_getflightclassdetails`({$classid})";
        return $this->getJSON($sql);
    }

    function deleteclass($classid) {
        $sql = "CALL `sp_deleteflightclass`({$classid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the flight class was deleted successfully"];
    }
}
?>
