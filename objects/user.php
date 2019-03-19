<?php

class User {

    // database connection and table name
    private $conn;
    private $table_name = "users";
    // object properties
    public $id;
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
                uuid_timestamp DESC";
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
                username = ? OR id = ?
            LIMIT
                0,1";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // bind id of players to be updated
        $stmt->bindParam(1, $this->username);
        $stmt->bindParam(2, $this->id);

        // execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->id = $row['id'];
        $this->username = $row['username'];
        $this->uuid_timestamp = $row['uuid_timestamp'];
    }

// update the user
    function update() {
        // update query
        $query = "UPDATE
            " . $this->table_name . "
            SET
            username = :username
            WHERE
            id = :id";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->username = htmlspecialchars(strip_tags($this->username));
        $this->id = htmlspecialchars(strip_tags($this->id));
        // bind new values
        $stmt->bindParam(':username', $this->username);
        $stmt->bindParam(':id', $this->id);

        // execute the query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

// delete the user
    function delete() {

        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE id = ? OR username = ?";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->id = htmlspecialchars(strip_tags($this->id));

        // bind id of record to delete
        $stmt->bindParam(1, $this->id);
        $stmt->bindParam(2, $this->username);

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
                uuid_timestamp >= ? OR id = ? OR username = ?
            ORDER BY
                username DESC";

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->username = htmlspecialchars(strip_tags($this->username));
        // bind
        $stmt->bindParam(1, $this->uuid_timestamp);
        $stmt->bindParam(2, $this->id);
        $stmt->bindParam(3, $this->username);


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
            ORDER BY uuid_timestamp DESC
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

}
