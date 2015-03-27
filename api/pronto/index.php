<?php
foreach (glob("inc/*.php") as $filename) {
	include $filename;
}

header('Access-Control-Allow-Headers: Content-Type,AUTH_USER,AUTH_PW,UID,CKEY,HKEY');
header('Access-Control-Allow-Methods: GET,POST,PUT,DELETE');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

if($_SERVER['REQUEST_METHOD'] === 'OPTIONS') exit;

$url = explode('/', trim($_REQUEST['_url'], '/'));
$method = strtolower($_SERVER['REQUEST_METHOD']);
$data = json_decode(file_get_contents("php://input"), true);
$db = new Database();
$auth = new Authenticate($method, $db);

if($url[0] !== 'api' || $url[1] !== 'pronto' && isset($url[3])) {
	new Error('NOT_FOUND');
} else {
	if($auth->validateLogin()) {
		if($url[2] === 'login' && !isset($url[3])) {
			echo '{"status": "redirect"}';
		} else if(array_key_exists($url[2], $apis)) {
			$process = new $apis[$url[2]](array_slice($url, 3), $method, $data, $db);
		} else {
			new Error('NOT_FOUND');
		}
	} else if($url[2] === 'login' && !isset($url[3])) {
		if($method == 'post') {
			$auth->login($_SERVER['HTTP_AUTH_USER'], $_SERVER['HTTP_AUTH_PW']);
		} else {
			new Error('NOT_FOUND');
		}
	} else {
		new Error('UNAUTH', 'Invalid authentication');
	}
}
?>