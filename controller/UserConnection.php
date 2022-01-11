<?php

class UserConnection
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

    public function checkRegisterParams()
    {
        if (!isset($this->post['username'])) array_push($this->response, 'username required');
        if (!isset($this->post['phone'])) array_push($this->response, 'phone required');
        if (!isset($this->post['password'])) array_push($this->response, 'password required');
        if (!isset($this->post['email'])) array_push($this->response, 'email required');

        if (count($this->response) > 0) {
            exit(json_encode(
                [
                    'result' => false,
                    'error' => $this->response
                ]
            ));
        }
    }

    public function checkExist()
    {
        $stmt = "SELECT * FROM `tbl_user` WHERE `phone` = ?";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param("s", $this->post['phone']);
        $stmt->execute();

        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            exit(json_encode(
                [
                    'result' => false,
                    'error' => 'user already existed'
                ]
            ));
        }
    }

    public function storeUser()
    {
        $password = hash('sha256', $this->post['password']);
        $stmt = "INSERT INTO `tbl_user` (`username`, `phone`, `email`, `password`, `status`) values (?, ?, ?, ?, 'NEW_USER')";
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param("ssss", $this->post['username'], $this->post['phone'], $this->post['email'], $password);
        if ($stmt->execute()) {
            exit(json_encode(
                [
                    'result' => true,
                    'msg' => 'user created successfully'
                ]
            ));
        }
    }

    public function checkLoginParams()
    {
        if (!isset($this->post['phoneOrEmail'])) array_push($this->response, 'phone or email required');
        if (!isset($this->post['password'])) array_push($this->response, 'password required');

        if (count($this->response) > 0) {
            exit(json_encode(
                [
                    'result' => false,
                    'error' => $this->response
                ]
            ));
        }
    }

    public function checkLogin()
    {
        $stmt = 'SELECT * FROM `tbl_user` WHERE `phone` = ? or `email` = ?';
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('ss', $this->post['phoneOrEmail'], $this->post['phoneOrEmail']);
        if ($stmt->execute()) {
            $result = $stmt->get_result();

            if ($result->num_rows <= 0) {
                exit(json_encode(
                    [
                        'result' => false,
                        'error' => 'user does not exist'
                    ]
                ));
            } else {
                $row = $result->fetch_assoc();

                if ($row['password'] == hash('sha256', $this->post['password'])) {
                    exit(json_encode(
                        [
                            'result' => true,
                            'msg' => 'logged in'
                        ]
                    ));
                } else {
                    exit(json_encode(
                        [
                            'result' => false,
                            'error' => 'wrong password'
                        ]
                    ));
                }
            }
        }
    }

    public function checkAuth()
    {
        $phone = @$_POST['phone'];
        $password = @$_POST['password'];

        $userId = $this->getUserId($phone);

        if (isset($userId) and isset($password)) {
            $password = hash('sha256', $password);
            $stmt = 'SELECT * FROM `tbl_user` WHERE `id` = ? and `password` = ?';
            $stmt = $this->conn->prepare($stmt);
            $stmt->bind_param('is', $userId, $password);
            $stmt->execute();
            $result = $stmt->get_result();
            return $result->num_rows > 0;
        } else {
            exit(json_encode(
                [
                    'result' => false,
                    'msg' => 'auth error'
                ]
            ));
        }
    }

    public function getUserId($phone)
    {
        $stmt = 'SELECT * FROM `tbl_user` WHERE `phone` = ?';
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('s', $phone);
        $stmt->execute();
        $row = $stmt->get_result()->fetch_assoc();
        return $row['id'];
    }

    public function updateUsername()
    {
        if (!isset($this->post['username'])) array_push($this->response, 'username required');
        if (!isset($this->post['phone'])) array_push($this->response, 'phone required');
        if (count($this->response) > 0) {
            exit(json_encode(
                [
                    'result' => false,
                    'error' => $this->response
                ]
            ));
        }

        $stmt = 'UPDATE `tbl_user` SET `username` = ? WHERE `phone` = ?';
        $stmt = $this->conn->prepare($stmt);
        $stmt->bind_param('ss', $this->post['username'], $this->post['phone']);
        $stmt->execute();
        if ($stmt->execute()) {
            exit(json_encode(
                [
                    'result' => true,
                    'msg' => 'username updated',
                ]
            ));
        } else {
            exit(json_encode(
                [
                    'result' => false,
                    'msg' => 'no username with that phone number is found'
                ]
            ));
        }
    }
}
