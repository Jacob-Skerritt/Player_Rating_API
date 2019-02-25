<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate subsitution object
include_once '../objects/substitution.php';
 
$database = new Database();
$db = $database->getConnection();
 
$substitution = new Substitution($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
echo $data->match_id;
echo $data->sub_player_id;
echo $data->starting_player_id;
echo $data->team_id;
// make sure data is not empty
if(
    !empty($data->match_id) &&
    !empty($data->sub_player_id) &&
    !empty($data->starting_player_id) &&
    !empty($data->team_id)
){
 
    // set substitution  property values
    $substitution->match_id = $data->match_id;
    $substitution->sub_player_id = $data->sub_player_id;
    $substitution->starting_player_id = $data->starting_player_id;
    $substitution->team_id = $data->team_id;

 
    // create the substitution
    if($substitution->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "substitution was created."));
    }
 
    // if unable to create the substitution, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create substitution."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create substitution. Data is incomplete."));
}
?>