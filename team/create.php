<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate team object
include_once '../objects/team.php';
 
$database = new Database();
$db = $database->getConnection();
 
$team = new Team($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->team_name) &&
    !empty($data->crest) &&
    !empty($data->manager)
){
 
    // set team  property values
    $team->team_name = $data->team_name;
    $team->crest = $data->crest;
    $team->manager = $data->manager;

 
    // create the team
    if($team->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "Team was created."));
    }
 
    // if unable to create the team, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create team."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create team. Data is incomplete."));
}
?>