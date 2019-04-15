<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/user.php';
 
// instantiate database and user object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$user = new User($db);
$data = json_decode(file_get_contents("php://input"));
 
$user->username = $data->username;
// query users



 
 
    $usernames=array(
        "usernames" => $user->userCount()
    );

    http_response_code(200);
 
    // show users data in json format
    echo json_encode($usernames);

