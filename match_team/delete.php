<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object file
include_once '../config/database.php';
include_once '../objects/match_team.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare match_team object
$match_team = new Match_Team($db);
 
// get match_team id
$data = json_decode(file_get_contents("php://input"));
 
// set match_team id to be deleted
$match_team->match_id = $data->match_id;
$match_team->team_id = $data->team_id;
 
// delete the match_team
if($match_team->delete()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "Match_Team was deleted."));
}
 
// if unable to delete the match_team
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Match_Unable to delete team."));
}
?>