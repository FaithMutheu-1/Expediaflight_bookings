<?php
require_once("db.php");

class users extends db {

    function checkuser($username) {
        $sql = "CALL `sp_checkuser`('{$username}')";
        return $this->getData($sql)->rowCount();
    }

    function saveuser($username, $password, $role) {
        $sql = "CALL `sp_saveusers`('{$username}', '{$password}', '{$role}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "user saved successfully"];
    }

    function getusers() {
        $sql = "CALL `sp_getusers`()";
        return $this->getJSON($sql);
    }

    function getuserdetails($userid) {
        $sql = "CALL `sp_getuserdetails`({$userid})";
        return $this->getJSON($sql);
    }

    function deleteuser($userid) {
        $sql = "CALL `sp_deleteusers`({$userid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the user was deleted successfully"];
    }
}
?>
