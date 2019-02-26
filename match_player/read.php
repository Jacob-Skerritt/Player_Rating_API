<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/match_player.php';
 
// instantiate database and match_player object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$match_player = new Match_Player($db);
 
// query match_players
$stmt = $match_player->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // match_players array
    $match_players_arr=array();
    $match_players_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $match_player_item=array(
            "match_id" => $match_id,
            "player_name" => $player_name,
            "team_name" => $team_name,
            "position" => $position
        );
 
        array_push($match_players_arr["records"], $match_player_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show match_players data in json format
    echo json_encode($match_players_arr);
}
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no match_players found
    echo json_encode(
        array("message" => "No match_players found.")
    );
}