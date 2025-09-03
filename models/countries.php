<?php
require_once("db.php");

class country extends db{
    function checkcountry($countryid, $countryname){
$sql="CALL `sp_checkcountry`({$countryid},'{countryname}')";
return $this->getData($sql)->rowCount();
    }

    function savecountry($countryid, $countryname){
$sql="CALL `sp_savecountry`({$countryid},'{$countryname}')";
$this->getData($sql);
return ["status"=>"success","message"=>"country save successfully"];
    }

    function getcountries(){
$sql="CALL `sp_getcountries`()";
return $this->getJSON($sql);
    }

function getcountrydetails($countryid){
$sql= "CALL `sp_getcountrydetails`({$countryid})";
return $this->getJSON($sql);
    }
    
    function deletecountry($countryid):array{
    $sql = "CALL `sp_deletecountries`({$countryid})";
    $result = $this->getData(sql:$sql);

    // Check if any rows were deleted
    if ($result && $result->rowCount() > 0) {
        return ["status" => "success", "message" => "The country was deleted successfully"];
    } else {
        return ["status" => "error", "message" => "Delete failed. Country not found or has dependencies"];
    }
}

}    

    
?>