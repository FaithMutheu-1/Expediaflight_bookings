<?php
require_once("db.php");

class passengers extends db {

    function checkpassenger($email) {
        $sql = "CALL `sp_checkpassenger`('{$email}')";
        return $this->getData($sql)->rowCount();
    }

    function savepassenger($passengerid, $firstname, $lastname, $email, $phone) {
        $sql = "CALL `sp_savepassenger`({$passengerid}, '{$firstname}', '{$lastname}', '{$email}', '{$phone}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "passenger saved successfully"];
    }

    function getpassengers() {
        $sql = "CALL `sp_getpassengers`()";
        return $this->getJSON($sql);
    }

    function getpassengerdetails($passengerid) {
        $sql = "CALL `sp_getpassengerdetails`({$passengerid})";
        return $this->getJSON($sql);
    }

    function deletepassenger($passengerid) {
        $sql = "CALL `sp_deletepassenger`({$passengerid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the passenger was deleted successfully"];
    }
}
?>
