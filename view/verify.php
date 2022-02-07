<?php

header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

require_once '../controller/ProductsController.php';
require_once '../controller/DBConnection.php';
$db = new DBConnection();
$pc = new ProductsController($_POST, $db);

$amount = $_GET['price'];
$sellId = $_GET['sellId'];
$Authority = $_GET['Authority'];
$data = array("merchant_id" => "4060409e-e239-11ea-9541-000c295eb8fc", "authority" => $Authority, "amount" => $amount);

$jsonData = json_encode($data);
$ch = curl_init('https://api.zarinpal.com/pg/v4/payment/verify.json');
curl_setopt($ch, CURLOPT_USERAGENT, 'ZarinPal Rest Api v4');
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
  'Content-Type: application/json',
  'Content-Length: ' . strlen($jsonData)
));

$result = curl_exec($ch);
$err = curl_error($ch);
$result = json_decode($result, true);
curl_close($ch);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  if ($result['data']['code'] == 100) {
    $pc->verifyBuy($sellId);

    echo json_encode([
      'result' => true,
      'msg' => 'paid successfuly',
      'action' => 'PAYMENT_SUCCESS',
      'refId' => $result['data']['ref_id']
    ]);
  } else {
    echo json_encode([
      'result' => false,
      'error' => $result['errors']['code'],
      'message' => $result['errors']['message'],
      'action' => 'PAYMENT_FAILED'
    ]);
  }
}
