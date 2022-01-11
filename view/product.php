<?php

require_once '../controller/DBConnection.php';
require_once '../controller/UserConnection.php';

$db = new DBConnection();
$uc = new UserConnection($_POST, $db);

if ($uc->checkAuth()) {
    require_once '../controller/ProductsController.php';
    $pc = new ProductsController($_POST, $db);

    if ($pc->checkProductParams()) {
        if (@$_POST['apiType'] == 'insert') $pc->insertProduct();
        if (@$_POST['apiType'] == 'buy') $pc->onBuy();
        if (@$_POST['apiType'] == 'select_all') $pc->selectAllProducts();
        if (@$_POST['apiType'] == 'select_by_type') $pc->selectProductsByType();
        if (@$_POST['apiType'] == 'select_by_subType') $pc->selectProductBySubtype();
        if (@$_POST['apiType'] == 'select_single') $pc->selectSingleProduct();
    }
}
