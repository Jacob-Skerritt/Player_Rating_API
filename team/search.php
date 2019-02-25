<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../config/database.php';
include_once '../objects/team.php';
 
// instantiate database and team object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$team = new Team($db);
 
// get keywords
$data = json_decode(file_get_contents("php://input"));

$team->team_name = $data->team_name;
$team->manager = $data->manager;
// query teams
$stmt = $team->search();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // teams array
    $teams_arr=array();
    $teams_arr["records"]=array();
 
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
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show teams data
    echo json_encode($teams_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no teams found
    echo json_encode(
        array("message" => "No teams found.")
    );
}
?>