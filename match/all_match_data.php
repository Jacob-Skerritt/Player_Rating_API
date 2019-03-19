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
include_once '../objects/rating.php';
// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare player object
$match = new Match($db);
$match_team = new Match_Team($db);
$team = new Team($db);
$player = new Player($db);
$ratings = new Rating($db);

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

if($num >0){
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);

        $match_teams[] = $team_id;
    }
    
    $ratings->match_id = $match->id;
    $stmt2 = $ratings->get_average_ratings();
    $num2 = $stmt2->rowCount();
    
    if ($num2 > 0) {

        // ratings array
        $ratings_arr = array();

        // retrieve our table contents
        // fetch() is faster than fetchAll()
        // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop



        while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)) {
            // extract row
            // this will make $row['name'] to
            // just $name only
            extract($row);
            $array[$player_id][] = $rating;
        }

            $count = 0;
        foreach ($array as $players => $player_ratings) {

            foreach ($player_ratings as $each_rating) {
                $count += $each_rating;
            }



                $rating_item = array(
                "player_id" => $players,
                "average_rating" => $count/sizeOf($array[$players])
            );
                
               

            array_push($ratings_arr, $rating_item);
             $count = 0;
            }
    }    
    
      $keys = array_keys($ratings_arr);
    foreach ($match_teams as $teams) {
        $team->id = $teams;
        $team->readOne();
        $player->team_name = $teams;
        $stmt = $player->search();
        $num = $stmt->rowCount();

        if ($num > 0) {

            // players array
            $players_arr = array();

            // retrieve our table contents
            // fetch() is faster than fetchAll()
            // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
          
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                // extract row
                // this will make $row['name'] to
                // just $name only
                extract($row);
                $player_rating =0;
                
                for($i = 0; $i < sizeOf($ratings_arr); $i++){
                   
                    if($ratings_arr[$keys[$i]]["player_id"] == $id){
                        $player_rating = $ratings_arr[$keys[$i]]["average_rating"];
                    }
                }
                
                $player_item = array(
                    "id" => $id,
                    "player_name" => $player_name,
                    "player_no" => $player_no,
                    "player_image" => $player_image,
                    "team_name" => $team_name,
                    "average_rating" => $player_rating
                );

                array_push($players_arr, $player_item);
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
}}else {
    // set response code - 404 Not found
    http_response_code(404);

    // tell the user player does not exist
    echo json_encode(array("message" => "Match does not exist."));
}
?>