<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/match_event.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and match_event object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$match_event = new match_event($db);
 
// query match_events
$stmt = $match_event->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // match_events array
    $match_events_arr=array();
    $match_events_arr["records"]=array();
    $match_events_arr["paging"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $match_event_item=array(
            "id" => $id,
            "match_id" => $match_id,
            "player_id" => $player_id,
            "event_id" => $event_id,
            "team_id" => $team_id,
            "time" =>$time
        );
 
        array_push($match_events_arr["records"], $match_event_item);
    }
 
 
    // include paging
    $total_rows=$match_event->count();
    $page_url="{$home_url}match_event/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $match_events_arr["paging"]=$paging;
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format
    echo json_encode($match_events_arr);
}
 
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user match_events does not exist
    echo json_encode(
        array("message" => "No match_events found.")
    );
}
?>