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
include_once '../objects/user.php';
include_once '../objects/match_player.php';
include_once '../objects/match_event.php';
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
$users = new User($db);
$match_player = new Match_Player($db);
$match_event = new Match_Event($db);


// set ID property of record to read
$data = json_decode(file_get_contents("php://input"));
$match->id = $data->id;
$team1_score = 0;
$team2_score = 0;

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
        "team1_score" => $team1_score,
        "team2_score" => $team2_score,
        "teams" => array(),
        "users" => array(),
        "user_ratings" => array(),
    );






    $match_team->match_id = $match->id;
    $stmt = $match_team->search();
    $num = $stmt->rowCount();

    if ($num > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // extract row
            // this will make $row['name'] to
            // just $name only
            extract($row);

            $match_teams[] = $team_id;
        }


        $match_event->match_id = $data->id;
        $match_event->event_id = 3;
        $stmtMatchEvent = $match_event->search();


        // match_events array


        while ($rowMatchEvent = $stmtMatchEvent->fetch(PDO::FETCH_ASSOC)) {
            // extract row
            // this will make $row['name'] to
            // just $name only
            extract($rowMatchEvent);
            if ($team_id == $match_teams[0]) {
                $$team1_score++;
            }

            if ($team_id == $match_teams[1]) {
                $team2_score++;
            }
        }

        $match_arr["team1_score"] = $team1_score;
        $match_arr["team2_score"] = $team2_score;
        $stmtUser = $users->read();
        $users_arr = array();

// check if more than 0 record found
        // users array
        // retrieve our table contents
        // fetch() is faster than fetchAll()
        // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
        while ($row = $stmtUser->fetch(PDO::FETCH_ASSOC)) {
            // extract row
            // this will make $row['name'] to
            // just $name only
            extract($row);

            $user_item = array(
                "id" => $id,
                "username" => $username
            );

            array_push($match_arr["users"], $user_item);
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
                    "average_rating" => $count / sizeOf($array[$players])
                );



                array_push($ratings_arr, $rating_item);
                $count = 0;
            }
        }

        $keys = array_keys($ratings_arr);

        $ratings->match_id = $data->id;
        $ratings->user_id = $data->user_id;
        $stmtSearchUser = $ratings->searchUser();
        $numSearchUser = $stmt->rowCount();

// check if more than 0 record found
        if ($numSearchUser > 0) {

            // ratings array

            // retrieve our table contents
            // fetch() is faster than fetchAll()
            // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
            while ($row = $stmtSearchUser->fetch(PDO::FETCH_ASSOC)) {
                // extract row
                // this will make $row['name'] to
                // just $name only
                extract($row);

                $rating_item = array(
                    "match_id" => $match_id,
                    "player_id" => $player_id,
                    "rating" => $rating,
                    "user_id" => $user_id,
                    "date_time" => $date_time
                );

                array_push($match_arr["user_ratings"], $rating_item);
            }
        }


            $match_player->match_id = $data->id;

            $stmt = $match_player->search();
            $num = $stmt->rowCount();


            // match_players array
            $match_players_arr = array();

            // retrieve our table contents
            // fetch() is faster than fetchAll()
            // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                // extract row
                // this will make $row['name'] to
                // just $name only
                extract($row);

                $match_player_item = array(
                    "player_name" => $player_name,
                    "position" => $position
                );


                array_push($match_players_arr, $match_player_item);
            }
            $keys2 = array_keys($match_players_arr);

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
                        $player_rating = 0;
                        $position = -1;

                        for ($i = 0; $i < sizeOf($ratings_arr); $i++) {

                            if ($ratings_arr[$keys[$i]]["player_id"] == $id) {
                                $player_rating = $ratings_arr[$keys[$i]]["average_rating"];
                            }
                        }

                        for ($i = 0; $i < sizeOf($match_players_arr); $i++) {

                            if ($match_players_arr[$keys2[$i]]["player_name"] == $player_name) {
                                $positon = $match_players_arr[$keys2[$i]]["position"];
                            }
                        }

                        $player_item = array(
                            "id" => $id,
                            "player_name" => $player_name,
                            "player_no" => $player_no,
                            "player_image" => $player_image,
                            "team_name" => $team_name,
                            "average_rating" => $player_rating,
                            "position" => $positon
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
        }
    } else {
        // set response code - 404 Not found
        http_response_code(404);

        // tell the user player does not exist
        echo json_encode(array("message" => "Match does not exist."));
    }
?>