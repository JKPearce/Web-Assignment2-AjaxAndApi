<?php

// database config file

$DB_HOST = "localhost";
$DB_USER = "root";
$DB_PASSWORD = "";

$DB_NAME = "assignment2";

$conn = mysqli_connect($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);

//checks to see if database connection is success
if(!$conn){
	$conn->connection_error;
}
?>