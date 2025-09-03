<?php
require_once("../models/payments.php");
$payment = new payments();

// Save payment
if (isset($_POST["savepayment"])) {
    $payment_id   = $_POST['paymentid'];
    $booking_id   = $_POST['bookingid'];
    $amount       = $_POST['amount'];
    $payment_date = $_POST['paymentdate'];
    $method       = $_POST['method'];

    $response = $payment->savepayment(
        paymentid: $payment_id,
        bookingid: $booking_id,
        amount: $amount,
        paymentdate: $payment_date,
        method: $method
    );
    echo json_encode($response);
}

// Get all payments
if (isset($_GET['getpayments'])) {
    echo $payment->getpayments();
}

// Get payment details
if (isset($_GET['getpaymentdetails'])) {
    $payment_id = $_GET['paymentid'];
    echo $payment->getpaymentdetails(paymentid: $payment_id);
}

// Delete payment
if (isset($_POST['deletepayment'])) {
    if (!isset($_POST['paymentid'])) {
        echo json_encode(["status" => "error", "message" => "paymentid required"]);
        exit;
    }
    $paymentid = $_POST['paymentid'];
    $response  = $payment->deletepayment(paymentid: $paymentid);
    echo json_encode($response);
    exit;
}
?>
