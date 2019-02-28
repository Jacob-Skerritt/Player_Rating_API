<?php

// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

// include database and object files
include_once '../config/database.php';
include_once '../objects/match.php';
include_once '../objects/match_team.php';
include_once '../objects/player.php';
include_once '../objects/team.php';
// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare player object
$match = new Match($db);
$match_team = new Match_Team($db);
$team = new Team($db);
$player = new Player($db);

// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$match->id = $data->id;
// read the details of player to be edited
$match->readOne();

if ($match->id != null) {
    // create array
    $match_arr = array(
        "id" => $match->id,
        "match_date_time" => $match->match_date_time,
        "match_location" => $match->match_location,
        "match_elapsed_time" => $match->match_elapsed_time,
        "match_location" => $match->match_location,
        "teams" => array()
    );

    $match_team->match_id = $match->id;
    $stmt = $match_team->search();
    $num = $stmt->rowCount();


    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);

        $match_teams[] = $team_id;
    }
    echo json_encode($match_teams);

    foreach ($match_teams as $teams) {
        $team->id = $teams;
        $team->readOne();
        $player->team_name = $teams;
        $stmt = $player->search();
        $num = $stmt->rowCount();

        if ($num > 0) {

            // players array
            $players_arr = array();
            $players_arr["records"] = array();

            // retrieve our table contents
            // fetch() is faster than fetchAll()
            // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                // extract row
                // this will make $row['name'] to
                // just $name only
                extract($row);

                $player_item = array(
                    "id" => $id,
                    "player_name" => $player_name,
                    "player_no" => $player_no,
                    "player_image" => $player_image,
                    "team_name" => $team_name
                );

                array_push($players_arr["records"], $player_item);
            }
        }

        $team_arr = array(
            "id" => $team->id,
            "team_name" => $team->team_name,
            "crest" => $team->crest,
            "manager" => $team->manager,
            "players" => $players_arr);

        array_push($match_arr["teams"], $team_arr);
    }


    http_response_code(200);

    // make it json format

    echo json_encode($match_arr);
} else {
    // set response code - 404 Not found
    http_response_code(404);

    // tell the user player does not exist
    echo json_encode(array("message" => "Match does not exist."));
}
?>