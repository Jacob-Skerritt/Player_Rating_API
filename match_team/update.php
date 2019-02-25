<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_team.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare match_team object
$match_team = new Match_Team($db);
 
// get id of match_team to be edited
$data = json_decode(file_get_contents("php://input"));
$match_id_to_change = $data->match_id_to_change;
$team_id_to_change = $data->team_id_to_change;

 
// set ID property of match_team to be edited
$match_team->match_id = $data->match_id;
 

    // set match_team property values
    $match_team->team_id = $data->team_id;
    $match_team->formation = $data->formation;
 
// update the match_team
if($match_team->update($match_id_to_change, $team_id_to_change)){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "Match_Team was updated."));
}
 
// if unable to update the match_team, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update match_team."));
}
?>