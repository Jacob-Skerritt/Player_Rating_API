<?php

class substitution {

    // database connection and table name
    private $conn;
    private $table_name = "matches_players";
    
   
    // object properties
    public $match_id;
    public $player_id;
    public $substitution_id;
    public $position;


    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read substitutions
    function read() {

        // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY
                player_id DESC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
    

// create substitution
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                player_id=:player_id, substitution_id=:substitution_id, position=:position";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->player_id = htmlspecialchars(strip_tags($this->player_id));
        $this->substitution_id = htmlspecialchars(strip_tags($this->substitution_id));
        $this->position = htmlspecialchars(strip_tags($this->position));
        // bind values
        $stmt->bindParam(":player_id", $this->player_id);
        $stmt->bindParam(":substitution_id", $this->substitution_id);
        $stmt->bindParam(":position", $this->position);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update substitutions form
function readOne(){
 
    // query to read single record
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            WHERE
                match_id = ?
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind match_id of players to be updated
    $stmt->bindParam(1, $this->match_id);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
    $this->player_id = $row['player_id'];
    $this->substitution_id = $row['substitution_id'];
    $this->position = $row['position'];

}

// update the substitutions
function update(){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            player_id = :player_id,
            substitution_id = :substitution_id,
            position = :position
            WHERE
            match_id = :match_id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->player_id=htmlspecialchars(strip_tags($this->player_id));
    $this->substitution_id=htmlspecialchars(strip_tags($this->substitution_id));
    $this->position=htmlspecialchars(strip_tags($this->position));
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    // bind new values
    $stmt->bindParam(':player_id', $this->player_id);
    $stmt->bindParam(':substitution_id', $this->substitution_id);
    $stmt->bindParam(':position', $this->position);
    $stmt->bindParam(':match_id', $this->match_id);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the substitution
function delete(){
 
    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE match_id = ?";
 
    // prepare query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
 
    // bind match_id of record to delete
    $stmt->bindParam(1, $this->match_id);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}

// search substitutions
function search(){
 
    // select all query
        $query = "SELECT
               *
            FROM
                " . $this->table_name . " 
            WHERE
                player_id LIKE ? OR position LIKE ?
            ORDER BY
                player_id DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 

 
    // bind
    $stmt->bindParam(1, $this->player_id);
    $stmt->bindParam(2, $this->position);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// read substitutions with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY player_id DESC
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

// used for paging substitutions
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
