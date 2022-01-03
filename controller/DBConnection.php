<?php

require_once 'config.php';

class DBConnection
{
    public mysqli $db;

    public function __construct()
    {
        $this->db = mysqli_connect(hostname, username, password, database);
    }

}