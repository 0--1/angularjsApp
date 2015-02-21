<?php
foreach (glob("inc/*.php") as $filename) {
	include $filename;
}

function __autoload($class_name) {
	include 'models/' . $class_name . '.php';
}


$url = explode('/', trim($_REQUEST['_url'], '/'));
$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"), true);

header('Content-Type: application/json');

if($url[0] != 'api' || $url[1] != 'pronto') {
	new Error('NOT_FOUND');
	exit();
}

if(array_key_exists($url[2], $apis)) {
	$process = new $apis[$url[2]](array_slice($url, 3), $method, $data);
} else {
	new Error('NOT_FOUND');
	exit();
}

echo "\nbye";
?>