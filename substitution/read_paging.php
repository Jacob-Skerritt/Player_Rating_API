<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/substitution.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and substitution object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$substitution = new substitution($db);
 
// query substitutions
$stmt = $substitution->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // substitutions array
    $substitutions_arr=array();
    $substitutions_arr["records"]=array();
    $substitutions_arr["paging"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $substitution_item=array(
            "id" => $id,
            "match_id" => $match_id,
            "sub_player_id" => $sub_player_id,
            "starting_player_id" => $starting_player_id,
            "team_id" => $team_id,
            "date_time" =>$date_time
        );
 
        array_push($substitutions_arr["records"], $substitution_item);
    }
 
 
    // include paging
    $total_rows=$substitution->count();
    $page_url="{$home_url}substitution/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $substitutions_arr["paging"]=$paging;
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format
    echo json_encode($substitutions_arr);
}
 
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user substitutions does not exist
    echo json_encode(
        array("message" => "No substitutions found.")
    );
}
?>