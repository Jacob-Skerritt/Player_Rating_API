<?php

class Event {

    // database connection and table name
    private $conn;
    private $table_name = "events";
    // object properties
    public $id;
    public $event;



    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read events
    function read() {

        // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY
                event DESC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }
    

// create event
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                event=:event";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->event = htmlspecialchars(strip_tags($this->event));

        // bind values
        $stmt->bindParam(":event", $this->event);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    
    // used when filling up the update events form
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
    $this->event = $row['event'];

}

// update the events
function update(){
    // update query
    $query = 
            "UPDATE
            ". $this->table_name ."
            SET
            event = :event
            WHERE
            id = :id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->event=htmlspecialchars(strip_tags($this->event));
    $this->id=htmlspecialchars(strip_tags($this->id));
    // bind new values
    $stmt->bindParam(':event', $this->event);
    $stmt->bindParam(':id', $this->id);
    
    // execute the query
    if($stmt->execute()){
        return true;
    }
    return false;
}

// delete the event
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

// search events
function search(){
 
    // select all query
        $query = "SELECT
               *
            FROM
                " . $this->table_name . " 
            WHERE
                event LIKE ? 
            ORDER BY
                event DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 

 
    // bind
    $stmt->bindParam(1, $this->event);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// read events with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY event DESC
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

// used for paging events
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
}

}
