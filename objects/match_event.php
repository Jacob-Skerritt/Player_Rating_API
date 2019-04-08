<?php

class Match_event{

    // database connection and table name
    private $conn;
    private $table_name = "matches_events";
    // object properties
    public $id;
    public $match_id;
    public $event_id;
    public $player_id;
    public $team_id;
    public $date_time;

    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read matches_events
    function read() {

        // select all query
        $query = "SELECT
               me.id, me.match_id, p.player_name, e.event, t.team_name as team_name, me.date_time
            FROM
                " . $this->table_name . " me
                LEFT JOIN
                    teams t
                        ON me.team_id = t.id
                LEFT JOIN
                    players p
                        ON me.player_id = p.id
                LEFT JOIN
                    events e
                        ON me.event_id = e.id
            ORDER BY
                team_name DESC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
    

// create match_event
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                match_id=:match_id, event_id=:event_id, player_id=:player_id, team_id=:team_id";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->match_id = htmlspecialchars(strip_tags($this->match_id));
        $this->event_id = htmlspecialchars(strip_tags($this->event_id));
        $this->player_id = htmlspecialchars(strip_tags($this->player_id));
        $this->team_id = htmlspecialchars(strip_tags($this->team_id));
        // bind values
        $stmt->bindParam(":match_id", $this->match_id);
        $stmt->bindParam(":event_id", $this->event_id);
        $stmt->bindParam(":player_id", $this->player_id);
        $stmt->bindParam(":team_id", $this->team_id);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update matches_events form
function readOne(){
 
    // query to read single record
        $query = "SELECT
               me.id, me.match_id, p.player_name, e.event, t.team_name as team_name, me.date_time
            FROM
                " . $this->table_name . " me
                LEFT JOIN
                    teams t
                        ON me.team_id = t.id
                LEFT JOIN
                    players p
                        ON me.player_id = p.id
                LEFT JOIN
                    events e
                        ON me.event_id = e.id
            WHERE
                me.id = ?
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
    $this->event_id = $row['event'];
    $this->player_id = $row['player_name'];
    $this->team_id = $row['team_name'];
    $this->date_time = $row['date_time'];

}

// update the matches_events
function update($match_to_change){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            match_id = :match_id,
            event_id = :event_id,
            player_id = :player_id,
            team_id = :team_id
            WHERE
            id = :id AND match_id =:match_to_change";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->match_id=htmlspecialchars(strip_tags($this->match_id));
    $this->event_id=htmlspecialchars(strip_tags($this->event_id));
    $this->player_id=htmlspecialchars(strip_tags($this->player_id));
    $this->team_id = htmlspecialchars(strip_tags($this->team_id));
    $this->id=htmlspecialchars(strip_tags($this->id));
    // bind new values
    $stmt->bindParam(':match_id', $this->match_id);
    $stmt->bindParam(':event_id', $this->event_id);
    $stmt->bindParam(':player_id', $this->player_id);
    $stmt->bindParam(':team_id', $this->team_id);
    $stmt->bindParam(':id', $this->id);
    $stmt->bindParam(':match_to_change', $match_to_change);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the match_event
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

// search match_events
function search(){
 
    // select all query
        $query = "SELECT
               me.id, me.match_id, me.player_id, me.event_id, e.event, me.team_id, me.date_time
            FROM
                " . $this->table_name . " me
                LEFT JOIN 
                    events e
                        ON me.event_id = e.id
            WHERE
                me.match_id = ? 
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

// read matches_events with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
               me.id, me.match_id, p.player_name, e.event, t.team_name as team_name, me.date_time
            FROM
                " . $this->table_name . " me
                LEFT JOIN
                    teams t
                        ON me.team_id = t.id
                LEFT JOIN
                    players p
                        ON me.player_id = p.id
                LEFT JOIN
                    events e
                        ON me.event_id = e.id
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

// used for paging matches_events
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
