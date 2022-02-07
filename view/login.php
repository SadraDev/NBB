<?php

header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

require_once '../controller/DBConnection.php';
require_once '../controller/UserConnection.php';

$db = new DBConnection();
$uc = new UserConnection($_POST, $db);

$uc->checkLoginParams();
$uc->checkLogin();
