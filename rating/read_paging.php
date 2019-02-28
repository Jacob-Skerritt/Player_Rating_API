<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/rating.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and rating object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$ratings = new Rating($db);
 
// query ratings
$stmt = $ratings->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // ratingss array
    $ratings_arr=array();
    $ratings_arr["records"]=array();
    $ratings_arr["paging"]=array();
 
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
            "user_id" =>$user_id,
            "date_time" =>$date_time
        );
 
        array_push($ratings_arr["records"], $rating_item);
    }
 
 
    // include paging
    $total_rows=$ratings->count();
    $page_url="{$home_url}rating/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $ratings_arr["paging"]=$paging;
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format
    echo json_encode($ratings_arr);
}
 
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user ratings does not exist
    echo json_encode(
        array("message" => "No ratings found.")
    );
}
?>