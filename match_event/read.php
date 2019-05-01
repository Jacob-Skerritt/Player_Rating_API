<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_event.php';
 
// instantiate database and match_event object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$match_event = new Match_Event($db);
 
// query match_events
$stmt = $match_event->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // match_events array
    $match_events_arr=array();
    $match_events_arr["records"]=array();
 
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
            "player_name" => $player_name,
            "event_id" => $event,
            "team_name" => $team_name,
            "time" =>$time
        );
 
        array_push($match_events_arr["records"], $match_event_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show match_events data in json format
    echo json_encode($match_events_arr);
}
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no match_events found
    echo json_encode(
        array("message" => "No match_events found.")
    );
}