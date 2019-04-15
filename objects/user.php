<?php

class User {

    // database connection and table name
    private $conn;
    private $table_name = "users";
    // object properties
    public $username;
    public $uuid_timestamp;

    // constructor with $db as database connection
    public function __construct($db) {
        $this->conn = $db;
    }

    // read user
    function read() {

        // select all query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY
                username ASC";
        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // execute query
        $stmt->execute();

        return $stmt;
    }

// create user
    function create() {

        // query to insert record
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                username=:username";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->username = htmlspecialchars(strip_tags($this->username));

        // bind values
        $stmt->bindParam(":username", $this->username);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function readOne() {

        // query to read single record
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            WHERE
                username = ? 
            LIMIT
                0,1";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // bind id of players to be updated
        $stmt->bindParam(1, $this->username);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->username = $row['username'];
        $this->uuid_timestamp = $row['uuid_timestamp'];
    }

// update the user
    function update($username_to_change) {
        // update query
        $query = "UPDATE
            " . $this->table_name . "
            SET
            username = :username
            WHERE
            username = :username_to_change";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->username = htmlspecialchars(strip_tags($this->username));
        
        // bind new values
        $stmt->bindParam(':username', $this->username);
        $stmt->bindParam(':username_to_change', $username_to_change);

        // execute the query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

// delete the user
    function delete() {

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE  username = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->username = htmlspecialchars(strip_tags($this->username));

        // bind id of record to delete
        $stmt->bindParam(1, $this->username);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

// search user
    function search() {

        // select all query
        $query = "SELECT
               *
            FROM
                " . $this->table_name . " 
            WHERE
                 uuid_timestamp > ?
            ORDER BY
                uuid_timestamp DESC";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->uuid_timestamp = htmlspecialchars(strip_tags($this->uuid_timestamp));

        $stmt->bindParam(1, $this->uuid_timestamp);


        // execute query
        $stmt->execute();

        return $stmt;
    }

// read user with pagination
    public function readPaging($from_record_num, $records_per_page) {

        // select query
        $query = "SELECT
                *
            FROM
                " . $this->table_name . " 
            ORDER BY username ASC
            LIMIT ?, ?";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // bind variable values
        $stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
        $stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);

        // execute query
        $stmt->execute();

        // return values from database
        return $stmt;
    }

// used for paging users
    public function count() {
        $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row['total_rows'];
    }
    
    
     function userCount() {
        $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . " WHERE username LIKE ?";

        $stmt = $this->conn->prepare($query);
        $string = "%".$this->username."%";
        $stmt->bindParam(1,$string);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        

        return $row['total_rows'];
    }

}
