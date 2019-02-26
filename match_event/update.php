<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_event.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare match_event object
$match_event = new match_event($db);
 
// get id of match_event to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of match_event to be edited
$match_event->id = $data->id;
$match_event->match_id = $data->match_id;
$match_event->player_id = $data->player_id;
$match_event->event_id = $data->event_id;
$match_event->team_id = $data->team_id;
$match_to_change = $data->match_to_change;
 
// update the match_event
if($match_event->update($match_to_change)){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "match_event was updated."));
}
 
// if unable to update the match_event, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update match_event."));
}
?>