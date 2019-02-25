<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/team.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and team object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$team = new Team($db);
 
// query teams
$stmt = $team->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // teams array
    $teams_arr=array();
    $teams_arr["records"]=array();
    $teams_arr["paging"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $team_item=array(
            "id" => $id,
            "team_name" => $team_name,
            "crest" => $crest,
            "manager" => $manager
        );
 
        array_push($teams_arr["records"], $team_item);
    }
 
 
    // include paging
    $total_rows=$team->count();
    $page_url="{$home_url}team/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $teams_arr["paging"]=$paging;
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format
    echo json_encode($teams_arr);
}
 
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user teams does not exist
    echo json_encode(
        array("message" => "No teams found.")
    );
}
?>