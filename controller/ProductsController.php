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

        switch ($apiType){
            case 'insert' :{
                if (!isset($this->post['product_name'])) array_push($this->response, 'product_name required');
                if (!isset($this->post['product_type'])) array_push($this->response, 'product_type required');
                if (!isset($this->post['product_subtype'])) array_push($this->response, 'product_subtype required');
                if (!isset($this->post['price'])) array_push($this->response, 'price required');
                if (!isset($this->post['min_size'])) array_push($this->response, 'min_size required');
                if (!isset($this->post['max_size'])) array_push($this->response, 'max_size required');
                if (!isset($this->post['colors'])) array_push($this->response, 'colors required');
                if (!isset($this->post['image'])) array_push($this->response, 'image required');
                if (!isset($this->post['description'])) array_push($this->response, 'description required');

                if (count($this->response) > 0) {
                    exit(json_encode(
                        [
                            'result' => false,
                            'error' => $this->response
                        ]
                    ));
                }
                break;
            }
            case 'select_all' :{
                if (!isset($this->post['product_type'])) array_push($this->response, 'product_type required');

                if (count($this->response) > 0) {
                    exit(json_encode(
                        [
                            'result' => false,
                            'error' => $this->response
                        ]
                    ));
                }
                break;
            }
            case 'select_by_subType' :{
                if (!isset($this->post['product_type'])) array_push($this->response, 'product_type required');
                if (!isset($this->post['product_subtype'])) array_push($this->response, 'product_subtype required');

                if (count($this->response) > 0) {
                    exit(json_encode(
                        [
                            'result' => false,
                            'error' => $this->response
                        ]
                    ));
                }
                break;
            }
            case 'select_single' :{
                if (!isset($this->post['product_type'])) array_push($this->response, 'product_type required');
                if (!isset($this->post['product_subtype'])) array_push($this->response, 'product_subtype required');
                if (!isset($this->post['product_id'])) array_push($this->response, 'product_id required');

                if (count($this->response) > 0) {
                    exit(json_encode(
                        [
                            'result' => false,
                            'error' => $this->response
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
        $stmt = "INSERT INTO `tbl_product` (`product_name`, `product_type`, `product_subtype`, `min_size`, `max_size`, `colors`, `price`, `image`, `description`, `deleted`) values  (?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('sssiissss', $this->post['product_name'],$this->post['product_type'],$this->post['product_subtype'], $this->post['min_size'], $this->post['max_size'], $this->post['colors'], $this->post['price'], $this->post['image'], $this->post['description']);
        $result = $stmt->execute();
        if($result){
            exit(json_encode(
                [
                    'result' => true,
                    'msg' => 'product inserted'
                ]
            ));
        } else{
            exit(json_encode(
                [
                    'result' => $stmt->execute(),
                    'msg' => 'product didnt inserted'
                ]
            ));
        }
    }

    public function selectAllProducts()
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
}