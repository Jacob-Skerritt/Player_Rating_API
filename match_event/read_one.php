<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_event.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$match_event = new Match_Event($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$match_event->id = $data->id; 
// read the details of player to be edited
$match_event->readOne();
 
if($match_event->match_id!=null){
    // create array
    $match_event_arr = array(
        "id" =>  $match_event->id,
        "match_id" => $match_event->match_id,
        "player_id" => $match_event->player_id,
        "event_id" => $match_event->event_id,
        "team_id" => $match_event->team_id,
        "date_time" =>$match_event->date_time
 
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($match_event_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "match_event does not exist."));
}
?>