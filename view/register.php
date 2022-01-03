<?php

require_once '../controller/DBConnection.php';
require_once '../controller/UserConnection.php';

$db = new DBConnection();
$uc = new UserConnection($_POST, $db);

$uc->checkRegisterParams();
$uc->checkExist();
$uc->storeUser();
