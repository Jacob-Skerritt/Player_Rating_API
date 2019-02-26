<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../config/database.php';
include_once '../objects/player.php';
 
// instantiate database and player object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$player = new Player($db);
 
// get keywords
$data = json_decode(file_get_contents("php://input"));

if($data->player_name !=null){
    $player->player_name = $data->player_name;
}else {
$player->player_name = "N/A";}

if($data->player_no != null){
    $player->player_no = $data->player_no;
}else
{
    $player->player_no = -1;
}

if($data->team_name !=null)
{
    $player->team_name = $data->team_name;
}else{
    $player->team_name = "N/A";
}


 
// query players
$stmt = $player->search();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // players array
    $players_arr=array();
    $players_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $player_item=array(
            "id" => $id,
            "player_name" => $player_name,
            "player_no" => $player_no,
            "player_image" => $player_image,
            "team_name" => $team_name
        );
 
        array_push($players_arr["records"], $player_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show players data
    echo json_encode($players_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no players found
    echo json_encode(
        array("message" => "No players found.")
    );
}
?>