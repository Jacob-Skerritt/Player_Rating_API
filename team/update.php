<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/team.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare team object
$team = new Team($db);
 
// get id of team to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of team to be edited
$team->id = $data->id;
 

    // set team property values
    $team->team_name = $data->team_name;
    $team->crest = $data->crest;
    $team->manager = $data->manager;
    $team->home_colours = $data->home_colours;
    $team->away_colours =$data->away_colours;
    $team->alt_colours =$data->alt_colours;
 
// update the team
if($team->update()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "Team was updated."));
}
 
// if unable to update the team, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update team."));
}
?>