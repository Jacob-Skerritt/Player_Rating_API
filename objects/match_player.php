<?php

class Match_player {

    // database connection and table name
    private $conn;
    private $table_name = "matches_players";
    
   
    // object properties
    public $match_id;
    public $player_id;
    public $team_id;
    public $position;


    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read match_players
    function read() {

        $query = "SELECT
                ms.match_id, t.team_name as team_name,p.player_name as player_name, ms.position
            FROM
                " . $this->table_name . " ms
                    LEFT JOIN 
                        teams t 
                            ON ms.team_id = t.id
                    LEFT JOIN
                        players p
                            ON ms.player_id = p.id
            ORDER BY
                match_id DESC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
    

// create match_player
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                match_id =:match_id, player_id=:player_id,team_id=:team_id, position=:position";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->match_id = htmlspecialchars(strip_tags($this->match_id));
        $this->player_id = htmlspecialchars(strip_tags($this->player_id));
        $this->team_id = htmlspecialchars(strip_tags($this->team_id));
        $this->position = htmlspecialchars(strip_tags($this->position));
        // bind values
        $stmt->bindParam(":match_id", $this->match_id);
        $stmt->bindParam(":player_id", $this->player_id);
        $stmt->bindParam(":team_id", $this->team_id);
        $stmt->bindParam(":position", $this->position);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update match_players form
function readOne(){
 
    // query to read single record
        $query = "SELECT
                ms.match_id, t.team_name as team_name,p.player_name as player_name, ms.position
            FROM
                " . $this->table_name . " ms
                    LEFT JOIN 
                        teams t 
                            ON ms.team_id = t.id
                    LEFT JOIN
                        players p
                            ON ms.player_id = p.id 
            WHERE
                match_id = ? AND player_id = ?
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind match_id of players to be updated
    $stmt->bindParam(1, $this->match_id);
    $stmt->bindParam(2, $this->player_id);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
    // set values to object properties
    $this->player_id = $row['player_name'];
    $this->team_id = $row['team_name'];
    $this->position = $row['position'];

}

// update the match_players
function update($match_id_to_change, $match_player_id_to_change){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            match_id=:match_id,
            player_id=:player_id,
            team_id=:team_id,
            position=:position
            WHERE
            match_id =:match_id_to_change AND player_id=:match_player_id_to_change";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->player_id=htmlspecialchars(strip_tags($this->player_id));
    $this->team_id=htmlspecialchars(strip_tags($this->team_id));
    $this->position=htmlspecialchars(strip_tags($this->position));
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    
    
    // bind new values
    $stmt->bindParam(':match_id', $this->match_id);
    $stmt->bindParam(':player_id', $this->player_id);
    $stmt->bindParam(':team_id', $this->team_id);
    $stmt->bindParam(':position', $this->position);
    $stmt->bindParam(':match_id_to_change', $match_id_to_change);
    $stmt->bindParam(':match_player_id_to_change', $match_player_id_to_change);
   
    
    
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the match_player
function delete(){
 
    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE match_id = ? AND player_id = ?";
 
    // prepare query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
 
    // bind match_id of record to delete
    $stmt->bindParam(1, $this->match_id);
    $stmt->bindParam(2, $this->player_id);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}

// search match_players
function search(){
 
    // select all query
        $query = "SELECT
                ms.match_id, t.team_name as team_name,p.player_name as player_name, ms.position
            FROM
                " . $this->table_name . " ms
                    LEFT JOIN 
                        teams t 
                            ON ms.team_id = t.id
                    LEFT JOIN
                        players p
                            ON ms.player_id = p.id
            WHERE
                ms.match_id = ?
            ORDER BY
                match_id DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 

 
    // bind
    $stmt->bindParam(1, $this->match_id);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// read match_players with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                ms.match_id, t.team_name as team_name,p.player_name as player_name, ms.position
            FROM
                " . $this->table_name . " ms
                    LEFT JOIN 
                        teams t 
                            ON ms.team_id = t.id
                    LEFT JOIN
                        players p
                            ON ms.player_id = p.id
            ORDER BY
                match_id DESC
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

// used for paging match_players
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
