<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/rating.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare player object
$rating = new Rating($db);
 
// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$rating->match_id = $data->match_id; 
$rating->player_id = $data->player_id;
$rating->username = $data->username;
// read the details of player to be edited
$rating->readOne();
 
if($rating->match_id!=null && $rating->username!=null && $rating->player_id!=null){
    // create array
    $rating_arr = array(
        "match_id" => $rating->match_id,
        "player_id" => $rating->player_id,
        "rating" => $rating->rating,
        "username" =>$rating->username,
        "date_time" =>$rating->date_time
 
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format

    echo json_encode($rating_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user player does not exist
    echo json_encode(array("message" => "Rating does not exist."));
}
?>