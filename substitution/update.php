<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/substitution.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare substitution object
$substitution = new substitution($db);
 
// get id of substitution to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of substitution to be edited
$substitution->id = $data->id;
 

    // set substitution property values
    $substitution->match_id= $data->match_id;
    $substitution->sub_player_id = $data->sub_player_id;
    $substitution->starting_player_id = $data->starting_player_id;
    $substitution->team_id = $data->team_id;
 
// update the substitution
if($substitution->update()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "substitution was updated."));
}
 
// if unable to update the substitution, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update substitution."));
}
?>