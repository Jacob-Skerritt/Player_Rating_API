<?php

class Match {

    // database connection and table name
    private $conn;
    private $table_name = "matches";
    // object properties
    public $id;
    public $match_date_time;
    public $match_location;
    public $match_elapsed_time;
    public $competition;
    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read matches
    function read() {

        // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name ;
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }

// create match
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                match_date_time=:match_date_time, match_location=:match_location, match_elapsed_time=:match_elapsed_time, competition=:competition";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->match_date_time = htmlspecialchars(strip_tags($this->match_date_time));
        $this->match_location = htmlspecialchars(strip_tags($this->match_location));
        $this->match_elapsed_time = htmlspecialchars(strip_tags($this->match_elapsed_time));
        $this->competition = htmlspecialchars(strip_tags($this->competition));

        // bind values
        $stmt->bindParam(":match_date_time", $this->match_date_time);
        $stmt->bindParam(":match_location", $this->match_location);
        $stmt->bindParam(":match_elapsed_time", $this->match_elapsed_time);
        $stmt->bindParam(":competition", $this->competition);


        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update matches form
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
 
    // bind id of matches to be updated
    $stmt->bindParam(1, $this->id);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
   
    $this->match_date_time = $row['match_date_time'];
    $this->match_location = $row['match_location'];
    $this->match_elapsed_time = $row['match_elapsed_time'];
     $this->competition= $row['competition'];
}

// update the matches
function update(){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            match_date_time = :match_date_time,
            match_location = :match_location,
            match_elapsed_time = :match_elapsed_time,
            competition = :competition
            WHERE
            id = :id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->match_date_time=htmlspecialchars(strip_tags($this->match_date_time));
    $this->match_location=htmlspecialchars(strip_tags($this->match_location));
    $this->match_elapsed_time=htmlspecialchars(strip_tags($this->match_elapsed_time));
    $this->competition=htmlspecialchars(strip_tags($this->competition));
    $this->id=htmlspecialchars(strip_tags($this->id));
    // bind new values
    $stmt->bindParam(':match_date_time', $this->match_date_time);
    $stmt->bindParam(':match_location', $this->match_location);
    $stmt->bindParam(':match_elapsed_time', $this->match_elapsed_time);
    $stmt->bindParam(':competition', $this->competition);
    $stmt->bindParam(':id', $this->id);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the match
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

// search matches
function search(){
 
    // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            WHERE
                match_date_time = ? ";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize

 
    // bind
    $stmt->bindParam(1, $this->match_date_time);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// read matches with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
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

// used for paging matches
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
