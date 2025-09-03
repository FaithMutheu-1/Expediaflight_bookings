<?php
require_once("../models/flightbookings.php");
$flightbooking = new FlightBookings();

// Save flight booking
if (isset($_POST["saveflightbooking"])) {
    $booking_id   = $_POST['bookingid'];
    $flight_id    = $_POST['flightid'];
    $passenger_id = $_POST['passengerid'];
    $seat_id      = $_POST['seatid'];
    $booking_date = $_POST['bookingdate'];
    $status       = $_POST['status'];

    $response = $flightbooking->saveflightbooking(
        bookingid: $booking_id,
        flightid: $flight_id,
        passengerid: $passenger_id,
        seatid: $seat_id,
        bookingdate: $booking_date,
        status: $status
    );
    echo json_encode(value: $response);
}

// Get all flight bookings
if (isset($_GET['getflightbookings'])) {
    echo $flightbooking->getflightbookings();
}

// Get flight booking details
if (isset($_GET['getflightbookingdetails'])) {
    $booking_id = $_GET['bookingid'];
    echo $flightbooking->getflightbookingdetails(bookingid: $booking_id);
}

// Delete flight booking
if (isset($_POST['deleteflightbooking'])) {
    if (!isset($_POST['bookingid'])) {
        echo json_encode(value: ["status" => "error", "message" => "bookingid required"]);
        exit;
    }
    $bookingid = $_POST['bookingid'];
    $response  = $flightbooking->deleteflightbooking(bookingid: $bookingid);
    echo json_encode(value: $response);
    exit;
}
?>
