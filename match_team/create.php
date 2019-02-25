<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate matches_teams object
include_once '../objects/match_team.php';
 
$database = new Database();
$db = $database->getConnection();
 
$match_team = new Match_Team($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->match_id) &&
    !empty($data->team_id)
){
 
    // set match_team  property values
    $match_team->match_id = $data->match_id;
    $match_team->team_id = $data->team_id;
    $match_team->formation = $data->formation;

 
    // create the match_team
    if($match_team->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "Mach_Team was created."));
    }
 
    // if unable to create the match_team, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create Match_Team."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create Match_Team. Data is incomplete."));
}
?>