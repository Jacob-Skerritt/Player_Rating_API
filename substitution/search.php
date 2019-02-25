<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../config/database.php';
include_once '../objects/substitution.php';
 
// instantiate database and substitution object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$substitution = new substitution($db);
 
// get keywords
$data = json_decode(file_get_contents("php://input"));

$substitution->match_id = $data->match_id;
// query substitutions
$stmt = $substitution->search();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // substitutions array
    $substitutions_arr=array();
    $substitutions_arr["records"]=array();
 
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
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show substitutions data
    echo json_encode($substitutions_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no substitutions found
    echo json_encode(
        array("message" => "No substitutions found.")
    );
}
?>