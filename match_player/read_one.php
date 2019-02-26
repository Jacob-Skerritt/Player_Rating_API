<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_player.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$match_player = new Match_Player($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$match_player->match_id = $data->match_id; 
$match_player->player_id =$data->player_id;
// read the details of player to be edited
$match_player->readOne();
 
//Loaing the palyer id/team id with strings rather than numbers based on  the returned data value
if($match_player->match_id!=null && $match_player->player_id != null){
    // create array
    $match_player_arr = array(
        "match_id" =>  $match_player->match_id,
        "player_name" => $match_player->player_id,
        "team_name" => $match_player->team_id,
        "position" => $match_player->position
 
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($match_player_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "match_player does not exist."));
}
?>