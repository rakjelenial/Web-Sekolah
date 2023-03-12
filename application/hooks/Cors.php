<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Cors {

    public function __construct() {
        $allowed_origins = config_item('cors_allowed_origins');
        $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
        if (in_array($origin, $allowed_origins) || in_array('*', $allowed_origins)) {
            header('Access-Control-Allow-Origin: ' . $origin);
            header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
            header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
        }
    }
}
