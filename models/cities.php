<?php
require_once("db.php");

class cities extends db {

    // ✅ Check if city exists
    function checkcity($cityname, $countryid): int {
        $sql = "CALL `sp_checkcity`('{$cityname}', {$countryid})";
        $stmt = $this->getData($sql);
        if (!$stmt) return 0;

        $count = $stmt->rowCount();
        $stmt->closeCursor(); // important for stored procedures
        return $count;
    }

    // ✅ Save a new city
    function savecity($cityname, $countryid): array {
        // Check if city already exists
        if ($this->checkcity($cityname, $countryid) > 0) {
            return ["status" => "error", "message" => "City already exists in this country"];
        }

        // Save new city
        $sql = "CALL `sp_savecity`('{$cityname}', {$countryid})";
        $stmt = $this->getData($sql);
        if ($stmt) $stmt->closeCursor();

        return ["status" => "success", "message" => "City saved successfully"];
    }

    // ✅ Get all cities
    function getcities(): string {
        $sql = "CALL `sp_getcities`()";
        return $this->getJSON($sql); // getJSON already closes cursor
    }

    // ✅ Get details of a single city
    function getcitydetails($cityid): string {
        $sql = "CALL `sp_getcitydetails`({$cityid})";
        return $this->getJSON($sql);
    }

    // ✅ Delete a city (with row count check)
    function deletecity($cityid): array {
        $sql = "CALL `sp_deletecity`({$cityid})";
        $stmt = $this->getData($sql);
        if (!$stmt) {
            return ["status" => "error", "message" => "Delete failed. Could not execute procedure"];
        }

        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        if ($result && isset($result['rows_deleted']) && $result['rows_deleted'] > 0) {
            return ["status" => "success", "message" => "City deleted successfully"];
        } else {
            return ["status" => "error", "message" => "Delete failed. City not found or has dependencies"];
        }
    }
}
?>
