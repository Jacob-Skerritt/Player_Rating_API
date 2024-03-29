<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object file
include_once '../config/database.php';
include_once '../objects/match_event.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare match_event object
$match_event = new Match_Event($db);
 
// get match_event id
$data = json_decode(file_get_contents("php://input"));
 
// set match_event id to be deleted
$match_event->id = $data->id;
 
// delete the match_event
if($match_event->delete()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "match_event was deleted."));
}
 
// if unable to delete the match_event
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to delete match_event."));
}
?>