<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate rating object
include_once '../objects/rating.php';
 
$database = new Database();
$db = $database->getConnection();
 
$rating = new Rating($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->match_id) &&
    !empty($data->player_id) &&
    !empty($data->rating) &&
    !empty($data->username) 
){
 
    // set rating  property values
    $rating->match_id = $data->match_id;
    $rating->player_id = $data->player_id;
    $rating->rating = $data->rating;
    $rating->username =$data->username;
    

 
    // create the rating
    if($rating->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "Rating was created."));
    }
 
    // if unable to create the rating, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create rating ."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create rating. Data is incomplete."));
}
?>