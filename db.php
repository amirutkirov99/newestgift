<?php

// $connection = mysqli_connect('localhost', 'a0819989_amirutkirov99', 'amir2003', 'a0819989_amirutkirov99'); //server
$connection = mysqli_connect('localhost', 'root', '', 'bd');    //db xampp
// $connection = mysqli_connect('sql7.freemysqlhosting.net', 'sql7619974', 'hD29H3aK8P', 'sql7619974');
if(!$connection) {
    die("Database connection failed");
}
$q = "SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO'";
$connection -> query($q);

?>
