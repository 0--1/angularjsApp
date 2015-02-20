<?php
$url = explode('/', trim($_REQUEST['_url'], '/'));
// print_r($url);
$method = $_SERVER['REQUEST_METHOD'];
//check data for null
$data = json_decode(file_get_contents("php://input"), true);

if($url[0] != 'api' && $url[1] != 'pronto') {
    exit();
}

function __autoload($class_name) {
    include 'models/' . $class_name . '.php';
}

$apis = array('human' =>  'Human',
    'robot' => 'Robot');

header('Content-Type: application/json');
// http_response_code(403);
// echo json_encode($apis, JSON_PRETTY_PRINT);
// error class
if(array_key_exists($url[2], $apis)) {
    $process = new $apis[$url[2]](array_slice($url, 3), $method, $data);
} else {
    http_response_code(404);
    echo 'error!';
    exit();
}

echo "\nbye";
?>