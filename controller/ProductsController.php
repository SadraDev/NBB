<?php

class ProductsController
{
    private mysqli $conn;
    private DBConnection $db;
    private array $post;
    private array $response;

    public function __construct($post, $db)
    {
        $this->db = $db;
        $this->post = $post;
        $this->conn = $this->db->db;
        $this->response = [];
    }

    public function checkProductParams()
    {
        $apiType = @$this->post['apiType'];
        if (!isset($apiType)) {
            exit(json_encode([
                'result' => false,
                'error' => 'api type required'
            ]));
        }

        switch ($apiType) {
            case 'insert': {
                    if (!isset($this->post['product_name']) or $this->post['product_name'] == '') array_push($this->response, 'product_name required');
                    if (!isset($this->post['product_type']) or $this->post['product_type'] == '') array_push($this->response, 'product_type required');
                    if (!isset($this->post['product_subtype']) or $this->post['product_subtype'] == '') array_push($this->response, 'product_subtype required');
                    if (!isset($this->post['price']) or $this->post['price'] == '') array_push($this->response, 'price required');
                    if (!isset($this->post['min_size']) or $this->post['min_size'] == '') array_push($this->response, 'min_size required');
                    if (!isset($this->post['max_size']) or $this->post['max_size'] == '') array_push($this->response, 'max_size required');
                    if (!isset($this->post['colors']) or $this->post['colors'] == '') array_push($this->response, 'colors required');
                    if (!isset($this->post['home_product']) or $this->post['home_product'] == '') array_push($this->response, 'home_product required');
                    if (!isset($this->post['brand']) or $this->post['brand'] == '') array_push($this->response, 'brand required');
                    if (count($this->response) > 0) {
                        exit(json_encode(
                            [
                                'result' => false,
                                'error' => $this->response,
                                'action' => 'INSERT_FAILED'
                            ]
                        ));
                    }
                    break;
                }
            case 'delete': {
                    if (!isset($this->post['product_id']) or $this->post['product_id'] == '') array_push($this->response, 'product_name required');
                    if (!isset($this->post['product_type']) or $this->post['product_type'] == '') array_push($this->response, 'product_type required');
                    if (!isset($this->post['product_subtype']) or $this->post['product_subtype'] == '') array_push($this->response, 'product_subtype required');
                    if (count($this->response) > 0) {
                        exit(json_encode(
                            [
                                'result' => false,
                                'error' => $this->response,
                                'action' => 'DELETE_FAILED'
                            ]
                        ));
                    }
                    break;
                }
            case 'buy': {
                    if (!isset($this->post['user_name']) or $this->post['user_name'] == '') array_push($this->response, 'user_name required');
                    if (!isset($this->post['user_phone']) or $this->post['user_phone'] == '') array_push($this->response, 'user_phone required');
                    if (!isset($this->post['receiver_name']) or $this->post['receiver_name'] == '') array_push($this->response, 'receiver_name required');
                    if (!isset($this->post['receiver_phone']) or $this->post['receiver_phone'] == '') array_push($this->response, 'receiver_phone required');
                    if (!isset($this->post['receiver_address']) or $this->post['receiver_address'] == '') array_push($this->response, 'receiver_address required');
                    if (!isset($this->post['receiver_postal_code']) or $this->post['receiver_postal_code'] == '') array_push($this->response, 'receiver_postal_code required');
                    if (!isset($this->post['user_description'])) array_push($this->response, 'user_description required');
                    if (!isset($this->post['product_id']) or $this->post['product_id'] == '') array_push($this->response, 'product_id required');
                    if (!isset($this->post['product_name']) or $this->post['product_name'] == '') array_push($this->response, 'product_name required');
                    if (!isset($this->post['product_brand']) or $this->post['product_brand'] == '') array_push($this->response, 'product_brand required');
                    if (!isset($this->post['product_type']) or $this->post['product_type'] == '') array_push($this->response, 'product_type required');
                    if (!isset($this->post['product_subtype']) or $this->post['product_subtype'] == '') array_push($this->response, 'product_subtype required');
                    if (!isset($this->post['product_size']) or $this->post['product_size'] == '') array_push($this->response, 'size required');
                    if (!isset($this->post['product_color']) or $this->post['product_color'] == '') array_push($this->response, 'color required');
                    if (!isset($this->post['product_price']) or $this->post['product_price'] == '') array_push($this->response, 'price required');
                    if (!isset($this->post['product_image']) or $this->post['product_image'] == '') array_push($this->response, 'image required');
                    if (count($this->response) > 0) {
                        exit(json_encode(
                            [
                                'result' => false,
                                'error' => $this->response,
                                'action' => 'BUY_FAILED'
                            ]
                        ));
                    }
                    break;
                }
            case 'select_by_type': {
                    if (!isset($this->post['product_type']) or $this->post['product_type'] == '') array_push($this->response, 'product_type required');

                    if (count($this->response) > 0) {
                        exit(json_encode(
                            [
                                'result' => false,
                                'error' => $this->response,
                                'action' => 'SELECT_BY_TYPE_FAILED'
                            ]
                        ));
                    }
                    break;
                }
            case 'select_by_subType': {
                    if (!isset($this->post['product_type'])) array_push($this->response, 'product_type required');
                    if (!isset($this->post['product_subtype'])) array_push($this->response, 'product_subtype required');

                    if (count($this->response) > 0) {
                        exit(json_encode(
                            [
                                'result' => false,
                                'error' => $this->response,
                                'action' => 'SELECT_BY_SUBTYPE_FAILED'
                            ]
                        ));
                    }
                    break;
                }
            case 'select_single': {
                    if (!isset($this->post['product_type'])) array_push($this->response, 'product_type required');
                    if (!isset($this->post['product_subtype'])) array_push($this->response, 'product_subtype required');
                    if (!isset($this->post['product_id'])) array_push($this->response, 'product_id required');

                    if (count($this->response) > 0) {
                        exit(json_encode(
                            [
                                'result' => false,
                                'error' => $this->response,
                                'action' => 'SELECT_SINGLE_FAILED'
                            ]
                        ));
                    }
                    break;
                }
            case 'update_bought_check_marks': {
                    if (!isset($this->post['check_1'])) array_push($this->response, 'check_1 required');
                    if (!isset($this->post['check_2'])) array_push($this->response, 'check_2 required');
                    if (!isset($this->post['check_3'])) array_push($this->response, 'check_3 required');
                    if (!isset($this->post['archived'])) array_push($this->response, 'archived required');
                    if (!isset($this->post['sell_id'])) array_push($this->response, 'sell_id required');

                    if (count($this->response) > 0) {
                        exit(json_encode(
                            [
                                'result' => false,
                                'error' => $this->response,
                                'action' => 'UPDATE_CHECKS_FAILED'
                            ]
                        ));
                    }
                    break;
                }
        }
        return true;
    }

    public function insertProduct()
    {
        $file = @$_FILES['image'];
        $fileName = null;
        if (!empty($file)) {
            $fileName = $file['name'];
            move_uploaded_file($file['tmp_name'], '../uploads/' . $fileName);
        }

        $stmt = "INSERT INTO `tbl_product` (`product_name`, `product_type`, `product_subtype`, `min_size`, `max_size`, `colors`, `price`, `image`, `description`, `brand`, `home_product`) values  (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('sssiisssssi', $this->post['product_name'], $this->post['product_type'], $this->post['product_subtype'], $this->post['min_size'], $this->post['max_size'], $this->post['colors'], $this->post['price'], $fileName, $this->post['description'], $this->post['brand'], $this->post['home_product']);
        $result = $stmt->execute();
        if ($result) {
            exit(json_encode(
                [
                    'result' => true,
                    'msg' => 'product inserted',
                    'action' => 'INSERT_SUCCESS'
                ]
            ));
        } else {
            exit(json_encode(
                [
                    'result' => $stmt->execute(),
                    'msg' => 'product didnt inserted',
                    'action' => 'INSERT_FAILED'
                ]
            ));
        }
    }

    public function deleteProduct()
    {
        $stmt = "DELETE FROM `tbl_product` WHERE `id` = ? and `product_type` = ? and `product_subtype` = ?";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('iss', $this->post['product_id'], $this->post['product_type'], $this->post['product_subtype']);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            exit(json_encode(
                [
                    'result' => true,
                    'msg' => 'product is set for deleted',
                    'action' => 'DELETE_SUCCESS'
                ]
            ));
        } else {
            exit(json_encode(
                [
                    'result' => false,
                    'error' => 'product with that information does not exist',
                    'action' => 'DELETE_FAILED'
                ]
            ));
        }
    }

    public function selectAllProducts()
    {
        $stmt = "SELECT * FROM `tbl_product` ORDER BY `id` DESC";
        $stmt = $this->conn->prepare($stmt);
        $stmt->execute();
        $result = $stmt->get_result();
        exit(json_encode($result->fetch_all()));
    }

    public function selectProductsByType()
    {
        $stmt = "SELECT * FROM `tbl_product` where `product_type` = ? ORDER BY `id` DESC";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('s', $this->post['product_type']);
        $stmt->execute();
        $result = $stmt->get_result();
        exit(json_encode($result->fetch_all()));
    }

    public function selectProductBySubtype()
    {
        $stmt = "SELECT * FROM `tbl_product` where `product_type` = ? and `product_subtype` = ?";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('ss', $this->post['product_type'], $this->post['product_subtype']);
        $stmt->execute();
        $result = $stmt->get_result();
        exit(json_encode($result->fetch_all()));
    }

    public function selectSingleProduct()
    {
        $stmt = "SELECT * FROM `tbl_product` where `product_type` = ? and `product_subtype` = ? and `id` = ?";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('ssi', $this->post['product_type'], $this->post['product_subtype'], $this->post['product_id']);
        $stmt->execute();
        $result = $stmt->get_result();
        exit(json_encode($result->fetch_assoc()));
    }

    public function onBuy()
    {
        $now = date("Y-m-d H:i:s");
        $stmt = "INSERT INTO `tbl_sells`(`user_name`, `user_phone`, `receiver_name`, `receiver_phone`, `receiver_address`, `receiver_postal_code`, `user_description`, `product_id`, `product_name`, `product_brand`, `product_type`, `product_subtype`, `product_size`, `product_color`, `product_price`, `product_image`, `purchese_date`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('sssssssissssissss', $this->post['user_name'], $this->post['user_phone'], $this->post['receiver_name'], $this->post['receiver_phone'], $this->post['receiver_address'], $this->post['receiver_postal_code'], $this->post['user_description'], $this->post['product_id'], $this->post['product_name'], $this->post['product_brand'], $this->post['product_type'], $this->post['product_subtype'], $this->post['product_size'], $this->post['product_color'], $this->post['product_price'], $this->post['product_image'], $now);
        $inserted = $stmt->execute();
        $sellId = $stmt->insert_id;

        if ($inserted) {
            $nstmt = "INSERT INTO `tbl_sells_manager` (`sell_id`, `check_1`, `check_2`, `check_3`, `archived`) VALUES (?, '0', '0', '0', '0')";
            $nstmt = $this->conn->prepare($nstmt);
            $nstmt->bind_param('i', $sellId);
            $nstmt->execute();

            exit(json_encode(
                [
                    'result' => true,
                    'sellId' => $sellId,
                    'msg' => 'product added to sells list'
                ]
            ));
        }
    }

    public function verifyBuy($sellId)
    {
        $stmt = 'UPDATE `tbl_sells` SET `verified` = 1 WHERE `id` = ?';
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('i', $sellId);
        $stmt->execute();
    }

    public function getBoughtProductsForUser()
    {
        $stmt = "SELECT * FROM `tbl_sells` where `user_phone` = ? and `verified` = 1";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('s', $this->post['phone']);
        $stmt->execute();
        $result = $stmt->get_result();
        exit(json_encode($result->fetch_all()));
    }

    public function getAllBoughtProducts()
    {
        $stmt = "SELECT * FROM `tbl_sells` WHERE `verified` = 1 ORDER BY id DESC";
        $stmt = $this->conn->prepare($stmt);
        $stmt->execute();
        $result = $stmt->get_result();
        $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        exit(json_encode($data));
    }

    public function getAllBoughtProductsCheckMarks()
    {
        $stmt = "SELECT * FROM `tbl_sells_manager`";
        $stmt = $this->conn->prepare($stmt);
        $stmt->execute();
        $result = $stmt->get_result();
        $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        exit(json_encode($data));
    }

    public function updateBoughtProductsCheckMarks()
    {
        $check1 = $this->post['check_1'];
        $check2 = $this->post['check_2'];
        $check3 = $this->post['check_3'];
        $archived = $this->post['archived'];
        $sell_id = $this->post['sell_id'];

        $stmt = "UPDATE `tbl_sells_manager` SET `check_1` = ?, `check_2`= ?, `check_3`= ?, `archived` = ? WHERE `sell_id`= ?";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('iiiii', $check1, $check2, $check3, $archived, $sell_id);
        if ($stmt->execute()) {
            exit(json_encode([
                'result' => true,
                'msg' => 'updated checker'
            ]));
        }
    }
}
