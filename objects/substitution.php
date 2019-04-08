<?php

class Substitution {

    // database connection and table name
    private $conn;
    private $table_name = "substitutions";
    // object properties
    public $id;
    public $match_id;
    public $sub_player_id;
    public $starting_player_id;
    public $team_id;
    public $date_time;


    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read substitutions
    function read() {

        // select all query
        $query = "SELECT
                t.team_name as team_name,p.player_name as sub_player, p2.player_name as starting_player, s.id, s.match_id, s.date_time
            FROM
               " . $this->table_name . " s
                    LEFT JOIN 
                        teams t 
                            ON s.team_id = t.id
                    LEFT JOIN
                        players p
                            ON s.sub_player_id = p.id 
                    LEFT JOIN 
                        players p2 
                            on s.starting_player_id = p2.id
            ORDER BY
                match_id DESC";
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
                match_id=:match_id, sub_player_id=:sub_player_id, starting_player_id=:starting_player_id, team_id=:team_id";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->match_id = htmlspecialchars(strip_tags($this->match_id));
        $this->sub_player_id = htmlspecialchars(strip_tags($this->sub_player_id));
        $this->starting_player_id = htmlspecialchars(strip_tags($this->starting_player_id));
        $this->team_id = htmlspecialchars(strip_tags($this->team_id));
        
        // bind values
        $stmt->bindParam(":match_id", $this->match_id);
        $stmt->bindParam(":sub_player_id", $this->sub_player_id);
        $stmt->bindParam(":starting_player_id", $this->starting_player_id);
        $stmt->bindParam(":team_id", $this->team_id);

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
                t.team_name as team_name,p.player_name as sub_player, p2.player_name as starting_player, s.id, s.match_id, s.date_time
            FROM
               " . $this->table_name . " s
                    LEFT JOIN 
                        teams t 
                            ON s.team_id = t.id
                    LEFT JOIN
                        players p
                            ON s.sub_player_id = p.id 
                    LEFT JOIN 
                        players p2 
                            on s.starting_player_id = p2.id

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
    $this->sub_player_id = $row['sub_player_id'];
    $this->starting_player_id = $row['starting_player_id'];
    $this->team_id = $row['team_id'];
    $this->date_time = $row['date_time'];

}

// update the substitutions
function update(){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            match_id = :match_id,
            sub_player_id = :sub_player_id,
            starting_player_id = :starting_player_id,
            team_id = :team_id
            WHERE
            id = :id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    $this->sub_player_id=htmlspecialchars(strip_tags($this->sub_player_id));
    $this->starting_player_id=htmlspecialchars(strip_tags($this->starting_player_id));
    $this->team_id=htmlspecialchars(strip_tags($this->team_id));
    $this->id=htmlspecialchars(strip_tags($this->id));
    // bind new values
    $stmt->bindParam(':match_id', $this->match_id);
    $stmt->bindParam(':sub_player_id', $this->sub_player_id);
    $stmt->bindParam(':starting_player_id', $this->starting_player_id);
    $stmt->bindParam(':team_id', $this->team_id);
    $stmt->bindParam(':id', $this->id);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the substitution
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

// search substitutions
function search(){
 
    // select all query
        $query = "SELECT
                t.team_name as team_name,p.player_name as sub_player, p2.player_name as starting_player, s.id, s.match_id, s.date_time
            FROM
               " . $this->table_name . " s
                    LEFT JOIN 
                        teams t 
                            ON s.team_id = t.id
                    LEFT JOIN
                        players p
                            ON s.sub_player_id = p.id 
                    LEFT JOIN 
                        players p2 
                            on s.starting_player_id = p2.id
            WHERE
                match_id  = ?
                            ORDER BY
                s.date_time DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 

 
    // bind
    $stmt->bindParam(1, $this->match_id);

 
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

// used for paging substitutions
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
