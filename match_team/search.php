<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../config/database.php';
include_once '../objects/match_team.php';
 
// instantiate database and match_team object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$match_team = new Match_Team($db);
 
// get keywords
$data = json_decode(file_get_contents("php://input"));

$match_team->match_id = $data->match_id;
 
// query matches_teams
$stmt = $match_team->search();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // matches_teams array
    $matches_teams_arr=array();
    $matches_teams_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $match_team_item=array(
            "match_id" => $match_id,
            "team_id" => $team_id,
            "formation" => $formaiton
        );
 
        array_push($matches_teams_arr["records"], $match_team_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show matches_teams data
    echo json_encode($matches_teams_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no matches_teams found
    echo json_encode(
        array("message" => "No matches_teams found.")
    );
}
?>