<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/rating_history.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare rating object
$rating = new Rating_History($db);
 
// get id of rating to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of rating to be edited
$rating->id = $data->id;
 

    // set rating property values
    $rating->match_id = $data->match_id;
    $rating->player_id = $data->player_id;
    $rating->rating = $data->rating;
    $rating->username = $data->username;
 
// update the rating
if($rating->update()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "Rating was updated."));
}
 
// if unable to update the rating, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update rating."));
}
?>