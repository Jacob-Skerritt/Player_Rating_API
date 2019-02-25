<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_team.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$match_team = new Match_Team($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$match_team->match_id = $data->match_id; 
$match_team->team_id = $data->team_id;
// read the details of player to be edited
$match_team->readOne();
 
if(($match_team->match_id!=null) && ($match_team->team_id !=null)){
    // create array
    $match_team_arr = array(
        "match_id" =>  $match_team->match_id,
        "team_id" => $match_team->team_id,
        "formation" => $match_team->formation

    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($match_team_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "Match_Team does not exist."));
}
?>