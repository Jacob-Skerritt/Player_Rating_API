<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/substitution.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$substitution = new substitution($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$substitution->id = $data->id; 
// read the details of player to be edited
$substitution->readOne();
 
if($substitution->match_id!=null){
    // create array
    $substitution_arr = array(
        "id" =>  $substitution->id,
        "match_id" => $substitution->match_id,
        "sub_player_id" => $substitution->sub_player_id,
        "starting_player_id" => $substitution->starting_player_id,
        "team_id" => $substitution->team_id
 
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($substitution_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "substitution does not exist."));
}
?>