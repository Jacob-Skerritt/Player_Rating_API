<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate match_player object
include_once '../objects/match_player.php';
 
$database = new Database();
$db = $database->getConnection();
 
$match_player = new Match_Player($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 


// make sure data is not empty
if(
    !empty($data->match_id) &&
    !empty($data->player_id) &&
    !empty($data->team_id)
){
    
    if($data->position == null){
        $data->position = -1;
    }
 
    // set match_player  property values
    $match_player->match_id = $data->match_id;
    $match_player->player_id = $data->player_id;
    $match_player->team_id = $data->team_id;
    $match_player->position = $data->position;

 
    // create the match_player
    if($match_player->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "match_player was created."));
    }
 
    // if unable to create the match_player, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create match_player."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create match_player. Data is incomplete."));
}
?>