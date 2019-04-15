<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object file
include_once '../config/database.php';
include_once '../objects/user.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare user object
$user = new User($db);
 
// get user id
$data = json_decode(file_get_contents("php://input"));
 
// set user id to be deleted



if($data->username == null){
        http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to delete user. Data is incomplete."));
}
else if($data->username !=null){
    $user->username =$data->username;
    
        if($user->delete()){


        // set response code - 200 ok
        http_response_code(200);

        // tell the user
        echo json_encode(array("message" => "User was deleted."));
    }

    // if unable to delete the user
    else{

        // set response code - 503 service unavailable
        http_response_code(503);

        // tell the user
        echo json_encode(array("message" => "Unable to delete user."));
    }

}
?>