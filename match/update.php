<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare match object
$match = new Match($db);
 
// get id of match to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of match to be edited
$match->id = $data->id;
 

    // set match property values
    $match->match_date_time = $data->match_date_time;
    $match->match_location = $data->match_location;
    $match->match_elapsed_time = $data->match_elapsed_time;
    $match->competition = $data->competition;
 
// update the match
if($match->update()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "Match was updated."));
}
 
// if unable to update the match, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update match."));
}
?>