<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$match = new Match($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$match->id = $data->id; 
// read the details of player to be edited
$match->readOne();
 
if($match->match_date_time!=null){
    // create array
    $match_arr = array(
        "id" =>  $match->id,
        "match_date_time" => $match->match_date_time,
        "match_location" => $match->match_location,
        "match_elapsed_time" => $match->match_elapsed_time,
        "match_competition" => $match->match_competition
 
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($match_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "Match does not exist."));
}
?>