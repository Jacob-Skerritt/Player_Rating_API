<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/match.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and match object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$match = new Match($db);
 
// query matches
$stmt = $match->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // matches array
    $matches_arr=array();
    $matches_arr["records"]=array();
    $matches_arr["paging"]=array();
 
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
            "match_name" => $match_name,
            "crest" => $crest,
            "manager" => $manager
        );
 
        array_push($matches_arr["records"], $match_item);
    }
 
 
    // include paging
    $total_rows=$match->count();
    $page_url="{$home_url}match/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $matches_arr["paging"]=$paging;
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format
    echo json_encode($matches_arr);
}
 
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user matches does not exist
    echo json_encode(
        array("message" => "No matches found.")
    );
}
?>