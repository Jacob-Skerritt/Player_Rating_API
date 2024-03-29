<?php

class Rating_History {

    // database connection and table name
    private $conn;
    private $table_name = "ratings_history";
    // object properties
    public $id;
    public $match_id;
    public $player_id;
    public $rating;
    public $username;
    public $date_time;


    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }
    
    function get_average_ratings(){
        $query = "SELECT player_id, rating, username FROM
                " . $this->table_name . "
                    Where
                        match_id = ?
                    ORDER BY 
                        player_id";
        
        $stmt = $this->conn->prepare($query);
        
        $stmt->execute();
                
                return $stmt;
    }

    // read ratings
    function read() {

        // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY
                match_id ASC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
    

// create rating
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                match_id=:match_id, player_id=:player_id, rating=:rating, username=:username";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->match_id = htmlspecialchars(strip_tags($this->match_id));
        $this->player_id = htmlspecialchars(strip_tags($this->player_id));
        $this->rating = htmlspecialchars(strip_tags($this->rating));
        $this->username = html_entity_decode(strip_tags($this->username));
        // bind values
        $stmt->bindParam(":match_id", $this->match_id);
        $stmt->bindParam(":player_id", $this->player_id);
        $stmt->bindParam(":rating", $this->rating);
        $stmt->bindParam(":username", $this->username);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
   
function readOne(){
 
    // query to read single record
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            WHERE
                id = ?
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind id of players to be updated
    $stmt->bindParam(1, $this->id);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
    $this->match_id = $row['match_id'];
    $this->player_id = $row['player_id'];
    $this->rating = $row['rating'];
    $this->username =$row['username'];
    $this->date_time =$row['date_time'];

}

// update the ratings
function update(){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            match_id = :match_id,
            player_id = :player_id,
            rating = :rating,
            username =:username
            WHERE
            id = :id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    $this->player_id=htmlspecialchars(strip_tags($this->player_id));
    $this->rating=htmlspecialchars(strip_tags($this->rating));
    $this->username =htmlspecialchars(strip_tags($this->username));
    $this->id=htmlspecialchars(strip_tags($this->id));
    // bind new values
    $stmt->bindParam(':match_id', $this->match_id);
    $stmt->bindParam(':player_id', $this->player_id);
    $stmt->bindParam(':rating', $this->rating);
    $stmt->bindParam(':username', $this->username);
    $stmt->bindParam(':id', $this->id);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the rating
function delete(){
 
    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE id = ?";
 
    // prepare query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->id=htmlspecialchars(strip_tags($this->id));
 
    // bind id of record to delete
    $stmt->bindParam(1, $this->id);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}

// search ratings
function search(){
 
    // select all query
        $query = "SELECT
               *
            FROM
                " . $this->table_name . " 
            WHERE
                match_id = ?
                AND
                player_id = ?
            ORDER BY
                match_id DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
     // sanitize
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    $this->player_id=htmlspecialchars(strip_tags($this->player_id));
    // bind
    $stmt->bindParam(1, $this->match_id);
    $stmt->bindParam(2, $this->player_id);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
    

}

// read ratings with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY match_id ASC
            LIMIT ?, ?";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind variable values
    $stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
    $stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);
 
    // execute query
    $stmt->execute();
 
    // return values from database
    return $stmt;
}

// used for paging ratings
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
