<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object file
include_once '../config/database.php';
include_once '../objects/match_player.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare match_player object
$match_player = new Match_Player($db);
 
// get match_player id
$data = json_decode(file_get_contents("php://input"));
 
// set match_player id to be deleted
$match_player->match_id = $data->match_id;
$match_player->player_id = $data->player_id;
 
// delete the match_player
if($match_player->delete() && $match_player->match_id != null && $match_player->player_id!= null ){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "match_player was deleted."));
}
 
// if unable to delete the match_player
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to delete match_player."));
}
?>