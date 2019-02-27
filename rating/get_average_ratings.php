<?php

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// include database and object files
include_once '../config/database.php';
include_once '../objects/rating.php';

// instantiate database and rating object
$database = new Database();
$db = $database->getConnection();

// initialize object
$ratings = new Rating($db);

// query ratings
$stmt = $ratings->read();
$num = $stmt->rowCount();

// check if more than 0 record found
if ($num > 0) {

    // ratings array
    $ratings_arr = array();
    $ratings_arr["records"] = array();

    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop



    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
        $array[$player_id][] = $rating;
    }
    
        $count = 0;
    foreach ($array as $players => $player_ratings) {
        // $color_fruit is an array
        foreach ($player_ratings as $each_rating) {
            $count += $each_rating;
        }

        print  " " . $count/sizeOf($array[$players]) . "<br>";
       
        
            
            $rating_item = array(
            "player_id" => $players,
            "average_rating" => $count/sizeOf($array[$players])
        );

        array_push($ratings_arr["records"], $rating_item);
         $count = 0;
    }






    // set response code - 200 OK
    http_response_code(200);

    // show ratings data in json format
    echo json_encode($ratings_arr);
} else {

    // set response code - 404 Not found
    http_response_code(404);

    // tell the user no ratings found
    echo json_encode(
            array("message" => "No ratings found.")
    );
}