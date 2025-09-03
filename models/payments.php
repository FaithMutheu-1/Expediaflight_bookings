<?php
require_once("db.php");

class payments extends db {

    function checkpayment($bookingid, $paymentdate, $amount) {
        $sql = "CALL `sp_checkpayment`({$bookingid}, '{$paymentdate}', {$amount})";
        return $this->getData($sql)->rowCount();
    }

    function savepayment($paymentid, $bookingid, $amount, $paymentdate, $method) {
        $sql = "CALL `sp_savepayment`({$paymentid}, {$bookingid}, {$amount}, '{$paymentdate}', '{$method}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "payment saved successfully"];
    }

    function getpayments() {
        $sql = "CALL `sp_getpayments`()";
        return $this->getJSON($sql);
    }

    function getpaymentdetails($paymentid) {
        $sql = "CALL `sp_getpaymentdetails`({$paymentid})";
        return $this->getJSON($sql);
    }

    function deletepayment($paymentid) {
        $sql = "CALL `sp_deletepayments`({$paymentid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "the payment was deleted successfully"];
    }
}
?>
