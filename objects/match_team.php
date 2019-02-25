<?php

class Match_Team {

    // database connection and table name
    private $conn;
    private $table_name = "matches_teams";
    // object properties
    public $match_id;
    public $team_id;
    public $formation;


    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read matches_teams
    function read() {

        // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY
                match_id DESC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
    

// create matches_team
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                match_id=:match_id,team_id=:team_id, formation=:formation";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->match_id = htmlspecialchars(strip_tags($this->match_id));
        $this->team_id = htmlspecialchars(strip_tags($this->team_id));
        $this->formation = htmlspecialchars(strip_tags($this->formation));

        // bind values
        $stmt->bindParam(":match_id", $this->match_id);
        $stmt->bindParam(":team_id", $this->team_id);
        $stmt->bindParam(":formation", $this->formation);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update matches_teams form
function readOne(){
 
    // query to read single record
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            WHERE
                match_id = ? AND team_id = ?
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind id of players to be updated
    $stmt->bindParam(1, $this->match_id);
    $stmt->bindParam(2, $this->team_id);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
    $this->team_id = $row['team_id'];
    $this->formation = $row['formation'];

}

// update the matches_teams
function update($match_id_to_change,$team_id_to_change){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            match_id = :match_id,
            team_id = :team_id,
            formation = :formation
            WHERE
            match_id = :match_id_to_change AND team_id=:team_id_to_change";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->team_id=htmlspecialchars(strip_tags($this->team_id));
    $this->formation=htmlspecialchars(strip_tags($this->formation));
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    // bind new values
    $stmt->bindParam(':team_id', $this->team_id);
    $stmt->bindParam(':formation', $this->formation);
    $stmt->bindParam(':match_id', $this->match_id);
    $stmt->bindParam(':match_id_to_change', $match_id_to_change);
    $stmt->bindParam(':team_id_to_change', $team_id_to_change);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the matches_teames
function delete(){
 
    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE match_id = ? AND team_id = ? ";
 
    // prepare query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    $this->team_id=htmlspecialchars(strip_tags($this->team_id));
 
    // bind id of record to delete
    $stmt->bindParam(1, $this->match_id);
    $stmt->bindParam(2, $this->team_id);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}

// search matches_teams
function search(){
 
    // select all query
        $query = "SELECT
               *
            FROM
                " . $this->table_name . " 
            WHERE
                match_id LIKE ?
            ORDER BY
                team_id DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 

    // bind
    $stmt->bindParam(1, $this->match_id);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// read matches_teams with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY match_id DESC
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

// used for paging matches_teams
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
