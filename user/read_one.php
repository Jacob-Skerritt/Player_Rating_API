<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/user.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$user = new User($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));

if($data->id != null){
$user->id = $data->id;}
else{
    $user->id = 0;
}

if($data->user_uuid != null){
$user->user_uuid = $data->user_uuid;}
else{
    $user_uuid = "N/A";
}
// read the details of player to be edited
$user->readOne();
 
if($user->user_uuid!=null){
    // create array
    $user_arr = array(
        "id" =>  $user->id,
        "user_uuid" => $user->user_uuid,
        "uuid_timestamp" => $user->uuid_timestamp
 
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($user_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "User does not exist."));
}
?>