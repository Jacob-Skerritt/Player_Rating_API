<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_player.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare match_player object
$match_player = new Match_Player($db);
 
// get id of match_player to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of match_player to be edited
$match_id_to_change = $data->match_id_to_change;
$match_player_id_to_change = $data->match_player_id_to_change;


$match_player->match_id = $data->match_id;
$match_player->player_id = $data->player_id;
$match_player->team_id = $data->team_id;
$match_player->position= $data->position;


 
// update the match_player
if($match_player->update($match_id_to_change, $match_player_id_to_change) && $match_player->match_id != null && $match_player->player_id != null ){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "match_player was updated."));
}
 
// if unable to update the match_player, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update match_player."));
}
?>