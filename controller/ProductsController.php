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
                    if (!isset($this->post['image']) or $this->post['image'] == '') array_push($this->response, 'image required');
                    if (!isset($this->post['description']) or $this->post['description'] == '') array_push($this->response, 'description required');
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
                    if (!isset($this->post['user_phone']) or $this->post['user_phone'] == '') array_push($this->response, 'user_id required');
                    if (!isset($this->post['product_id']) or $this->post['product_id'] == '') array_push($this->response, 'product_id required');
                    if (!isset($this->post['product_type']) or $this->post['product_type'] == '') array_push($this->response, 'product_type required');
                    if (!isset($this->post['product_subtype']) or $this->post['product_subtype'] == '') array_push($this->response, 'product_subtype required');
                    if (!isset($this->post['product_price']) or $this->post['product_price'] == '') array_push($this->response, 'price required');
                    if (!isset($this->post['product_size']) or $this->post['product_size'] == '') array_push($this->response, 'size required');
                    if (!isset($this->post['product_color']) or $this->post['product_color'] == '') array_push($this->response, 'color required');
                    if (!isset($this->post['product_image']) or $this->post['product_image'] == '') array_push($this->response, 'image required');
                    if (!isset($this->post['product_name']) or $this->post['product_name'] == '') array_push($this->response, 'product_name required');
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
        }
        return true;
    }

    public function insertProduct()
    {
        $file = @$_FILES['image'];
        $fileName = null;
        if (!empty($file)) {
            if ($file['size'] > 10000000) {
                exit(json_encode(
                    [
                        'result' => false,
                        'error' => 'file size too big',
                        'action' => 'FILE_SIZE_OVER_LIMIT'
                    ]
                ));
            }
            $fileName = $file['name'];
            move_uploaded_file($file['tmp_name'], '../uploads/' . $fileName);
        }

        $stmt = "INSERT INTO `tbl_product` (`product_name`, `product_type`, `product_subtype`, `min_size`, `max_size`, `colors`, `price`, `image`, `description`, `deleted`) values  (?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('sssiissss', $this->post['product_name'], $this->post['product_type'], $this->post['product_subtype'], $this->post['min_size'], $this->post['max_size'], $this->post['colors'], $this->post['price'], $fileName, $this->post['description']);
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
        $stmt = "UPDATE `tbl_product` SET `deleted` = true WHERE `id` = ? and `product_type` = ? and `product_subtype` = ?";
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
        $stmt = "SELECT * FROM `tbl_product` where `product_type` = ?";
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
        $stmt = "INSERT INTO `tbl_sells` (`user_phone`, `product_id`, `product_name`, `product_type`, `product_subtype`, `product_size`, `product_color`, `product_image`, `product_price`, `purchese_date`) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('sisssissss', $this->post['user_phone'], $this->post['product_id'], $this->post['product_name'], $this->post['product_type'], $this->post['product_subtype'], $this->post['product_size'], $this->post['product_color'], $this->post['product_image'], $this->post['product_price'], $now);
        if ($stmt->execute()) {
            exit(json_encode(
                [
                    'result' => true,
                    'msg' => 'product added to sells list'
                ]
            ));
        }
    }

    public function getBoughtProductsForUser()
    {
        $stmt = "SELECT * FROM `tbl_sells` where `user_phone` = ?";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('s', $this->post['phone']);
        $stmt->execute();
        $result = $stmt->get_result();
        exit(json_encode($result->fetch_all()));
    }
}
