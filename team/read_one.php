<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/team.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$team = new Team($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$team->id = $data->id; 
// read the details of player to be edited
$team->readOne();
 
if($team->team_name!=null){
    // create array
    $team_arr = array(
        "id" =>  $team->id,
        "team_name" => $team->team_name,
        "crest" => $team->crest,
        "manager" => $team->manager
 
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($team_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "Team does not exist."));
}
?>