<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate player object
include_once '../objects/player.php';
 
$database = new Database();
$db = $database->getConnection();
 
$player = new Player($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->player_name) &&
    !empty($data->player_no) &&
    !empty($data->player_role)&&
    !empty($data->player_image) &&
    !empty($data->team_id) 
){
 
    // set player property values
    $player->player_name = $data->player_name;
    $player->player_no = $data->player_no;
    $player->player_role = $data->player_role;
    $player->player_image = $data->player_image;
    $player->team_id = $data->team_id;
 
    // create the player
    if($player->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "Player was created."));
    }
 
    // if unable to create the player, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create player."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create player. Data is incomplete."));
}
?>