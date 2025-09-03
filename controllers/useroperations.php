<?php
require_once("../models/users.php");
$user = new users();

// Save user
if (isset($_POST["saveuser"])) {
    $user_id  = $_POST['userid'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role     = $_POST['role'];

    $response = $user->saveuser(
        username: $username,
        password: $password,
        role: $role
    );
    echo json_encode($response);
}

// Get all users
if (isset($_GET['getusers'])) {
    echo $user->getusers();
}

// Get user details
if (isset($_GET['getuserdetails'])) {
    $user_id = $_GET['userid'];
    echo $user->getuserdetails(userid: $user_id);
}

// Delete user
if (isset($_POST['deleteuser'])) {
    if (!isset($_POST['userid'])) {
        echo json_encode(["status" => "error", "message" => "userid required"]);
        exit;
    }
    $userid   = $_POST['userid'];
    $response = $user->deleteuser(userid: $userid);
    echo json_encode($response);
    exit;
}
?>
