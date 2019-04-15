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



if($data->username == null){
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to located user. Data is incomplete."));


}
else if($data->username!=null){
    $user->username = $data->username;
    $user->readOne();
    // create array
    $user_arr = array(
        "username" => $user->username,
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