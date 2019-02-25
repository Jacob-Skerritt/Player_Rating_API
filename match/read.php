<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match.php';
 
// instantiate database and match object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$match = new Match($db);
 
// query matches
$stmt = $match->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // matches array
    $matches_arr=array();
    $matches_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $match_item=array(
            "id" => $id,
            "match_date_time" => $match_date_time,
            "match_location" => $match_location,
            "match_elapsed_time" => $match_elapsed_time,
            "match_competition" => $match_competition
        );
 
        array_push($matches_arr["records"], $match_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show matches data in json format
    echo json_encode($matches_arr);
}
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no matches found
    echo json_encode(
        array("message" => "No matches found.")
    );
}