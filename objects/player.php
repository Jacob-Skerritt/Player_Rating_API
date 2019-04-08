<?php

class Player {

    // database connection and table name
    private $conn;
    private $table_name = "players";
    // object properties
    public $id;
    public $player_name;
    public $player_no;
    public $player_role;
    public $player_image;
    public $team_id;
    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read playerss
    function read() {

        // select all query
        $query = "SELECT
                t.team_name as team_name, p.id, p.player_name, p.player_no,p.player_role, p.player_image
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    teams t
                        ON p.team_id = t.id
            ORDER BY
                team_name DESC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }

// create player
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                player_name=:player_name, player_no=:player_no,player_role:player_role, player_image=:player_image, team_id=:team_id";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->player_name = htmlspecialchars(strip_tags($this->player_name));
        $this->player_no = htmlspecialchars(strip_tags($this->player_no));
        $this->player_role = htmlspecialchars(strip_tags($this->player_role));
        $this->player_image = htmlspecialchars(strip_tags($this->player_image));
        $this->team_id = htmlspecialchars(strip_tags($this->team_id));

        // bind values
        $stmt->bindParam(":player_name", $this->player_name);
        $stmt->bindParam(":player_no", $this->player_no);
        $stmt->bindParam(":player_role", $this->player_role);
        $stmt->bindParam(":player_image", $this->player_image);
        $stmt->bindParam(":team_id", $this->team_id);


        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update players form
function readOne(){
 
    // query to read single record
        $query = "SELECT
                t.team_name as team_name, p.id, p.player_name, p.player_no,p.player_role, p.player_image
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    teams t
                        ON p.team_id = t.id
            WHERE
                p.id = ?
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
    $this->team_name = $row['team_name'];
    $this->player_name = $row['player_name'];
    $this->player_no = $row['player_no'];
    $this->player_role = $row['player_role'];
    $this->player_image = $row['player_image'];

}

// update the players
function update(){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            player_name = :player_name,
            player_no = :player_no,
            player_role =:player_role,
            player_image = :player_image,
            team_id = :team_id,
            WHERE
            id = :id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->player_name=htmlspecialchars(strip_tags($this->player_name));
    $this->player_no=htmlspecialchars(strip_tags($this->player_no));
    $this->player_role=htmlspecialchars(strip_tags($this->player_role));
    $this->player_image=htmlspecialchars(strip_tags($this->player_image));
    $this->team_id=htmlspecialchars(strip_tags($this->team_id));
    $this->id=htmlspecialchars(strip_tags($this->id));
    // bind new values
    $stmt->bindParam(':player_name', $this->player_name);
    $stmt->bindParam(':player_no', $this->player_no);
    $stmt->bindParam(':player_role', $this->player_role);
    $stmt->bindParam(':player_image', $this->player_image);
    $stmt->bindParam(':team_id', $this->team_id);
    $stmt->bindParam(':id', $this->id);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the player
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

// search players
function search(){
 
    // select all query
        $query = "SELECT
                t.team_name as team_name, p.id, p.player_name, p.player_no, p.player_role, p.player_image
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    teams t
                        ON p.team_id = t.id
            WHERE
               p.team_id = ? 
            ORDER BY
                team_name DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
 
    // bind
    $stmt->bindParam(1, $this->team_name);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// read playerss with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                t.team_name as team_name, p.id, p.player_name, p.player_no,p.player_role, p.player_image
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    teams t
                        ON p.team_id = t.id
            ORDER BY team_name DESC
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

// used for paging players
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
