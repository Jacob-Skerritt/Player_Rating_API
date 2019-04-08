<?php

class Team {

    // database connection and table name
    private $conn;
    private $table_name = "teams";
    // object properties
    public $id;
    public $team_name;
    public $crest;
    public $manager;
    public $home_colours;
    public $away_colours;
    public $alt_colours;


    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read teams
    function read() {

        // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY
                team_name DESC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
    

// create team
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                team_name=:team_name, crest=:crest, manager=:manager, home_colours=:home_colours, away_colours=:away_colours, alt_colours=:alt_colours";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->team_name = htmlspecialchars(strip_tags($this->team_name));
        $this->crest = htmlspecialchars(strip_tags($this->crest));
        $this->manager = htmlspecialchars(strip_tags($this->manager));
        $this->home_colours = htmlspecialchars(strip_tags($this->home_colours));
        $this->away_colours = htmlspecialchars(strip_tags($this->away_colours));
        $this->alt_colours = htmlspecialchars(strip_tags($this->alt_colours));
        // bind values
        $stmt->bindParam(":team_name", $this->team_name);
        $stmt->bindParam(":crest", $this->crest);
        $stmt->bindParam(":manager", $this->manager);
        $stmt->bindParam(":home_colours", $this->home_colours);
        $stmt->bindParam(":away_colours", $this->away_colours);
        $stmt->bindParam(":alt_colours", $this->alt_colours);
        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update teams form
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
    $this->team_name = $row['team_name'];
    $this->crest = $row['crest'];
    $this->manager = $row['manager'];
    $this->home_colours =$row['home_colours'];
    $this->away_colours =$row['away_colours'];
    $this->alt_colours =$row['alt_colours'];

}

// update the teams
function update(){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            team_name =:team_name,
            crest =:crest,
            manager =:manager,
            home_colours =:home_colours,
            away_colours =:away_colours,
            alt_colours =:alt_colours
            WHERE
            id =:id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->team_name=htmlspecialchars(strip_tags($this->team_name));
    $this->crest=htmlspecialchars(strip_tags($this->crest));
    $this->manager=htmlspecialchars(strip_tags($this->manager));
    $this->home_colours = htmlspecialchars(strip_tags($this->home_colours));
    $this->away_colours = htmlspecialchars(strip_tags($this->away_colours));
    $this->alt_colours = htmlspecialchars(strip_tags($this->alt_colours));
    $this->id=htmlspecialchars(strip_tags($this->id));

    // bind new values
    $stmt->bindParam(':team_name', $this->team_name);
    $stmt->bindParam(':crest', $this->crest);
    $stmt->bindParam(':manager', $this->manager);
    $stmt->bindParam(":home_colours", $this->home_colours);
    $stmt->bindParam("away_colours", $this->away_colours);
    $stmt->bindParam("alt_colours", $this->alt_colours);
    $stmt->bindParam(':id', $this->id);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the team
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

// search teams
function search(){
 
    // select all query
        $query = "SELECT
               *
            FROM
                " . $this->table_name . " 
            WHERE
                team_name LIKE ? OR manager LIKE ?
            ORDER BY
                team_name DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 

 
    // bind
    $stmt->bindParam(1, $this->team_name);
    $stmt->bindParam(2, $this->manager);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// read teams with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
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

// used for paging teams
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
