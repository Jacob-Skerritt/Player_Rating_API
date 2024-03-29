<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../config/database.php';
include_once '../objects/rating.php';
 
// instantiate database and rating object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$ratings = new Rating($db);
 
// get keywords
$data = json_decode(file_get_contents("php://input"));

    $ratings->match_id = $data->match_id;
    $ratings->player_id = $data->player_id;
// query ratings
$stmt = $ratings->search();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // ratings array
    $ratings_arr=array();
    $ratings_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $rating_item=array(
            "match_id" => $match_id,
            "player_id" => $player_id,
            "rating" => $rating,
            "username" => $username,
            "date_time" =>$date_time
        );
 
        array_push($ratings_arr["records"], $rating_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show ratings data
    echo json_encode($ratings_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no ratings found
    echo json_encode(
        array("message" => "No ratings found.")
    );
}
?>