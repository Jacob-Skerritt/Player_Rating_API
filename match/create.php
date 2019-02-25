<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate match object
include_once '../objects/match.php';
 
$database = new Database();
$db = $database->getConnection();
 
$match = new Match($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->match_date_time) &&
    !empty($data->match_location)
){
 
    // set match  property values
    $match->match_date_time = $data->match_date_time;
    $match->match_location = $data->match_location;
    $match->match_elapsed_time = $data -> match_elapsed_time;
    $match->competition = $data->competition;

 
    // create the match
    if($match->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "Match was created."));
    }
 
    // if unable to create the match, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create match."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create match. Data is incomplete."));
}
?>