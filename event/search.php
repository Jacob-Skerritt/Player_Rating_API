<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../config/database.php';
include_once '../objects/event.php';
 
// instantiate database and event object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$events = new event($db);
 
// get keywords
$data = json_decode(file_get_contents("php://input"));

$events->event = $data->event;
// query events
$stmt = $events->search();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // events array
    $events_arr=array();
    $events_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $event_item=array(
            "id" => $id,
            "event" => $event
        );
 
        array_push($events_arr["records"], $event_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show events data
    echo json_encode($events_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no events found
    echo json_encode(
        array("message" => "No events found.")
    );
}
?>