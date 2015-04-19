<?php
foreach (glob("inc/*.php") as $filename) {
	include $filename;
}

header('Access-Control-Allow-Headers: Content-Type,AUTH_USER,AUTH_PW,UID,CKEY,HKEY');
header('Access-Control-Allow-Methods: GET,POST,PUT,DELETE');
header('Access-Control-Allow-Origin: http://localhost:9000');
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

$url = explode('/', trim($_REQUEST['_url'], '/'));
$method = strtolower($_SERVER['REQUEST_METHOD']);
if(!in_array($method, $methods)) exit();
$data = json_decode(file_get_contents("php://input"), true);
$db = new Database();
$auth = new Authenticate($method, $db);

error_log(implode($url), 0);

if($auth->validateLogin()) {
	if($url[0] === 'login' && !isset($url[1])) {
		echo '{"status": "redirect"}';
	} else if(array_key_exists($url[0], $apis)) {
		$process = new $apis[$url[0]](array_slice($url, 1), $method, $data, $db);
	} else {
		new Error('NOT_FOUND');
	}
} else if(isset($url[0]) && $url[0] === 'login' && !isset($url[1])) {
	if($method == 'post') {
		$auth->login($_SERVER['HTTP_AUTH_USER'], $_SERVER['HTTP_AUTH_PW']);
	} else {
		new Error('NOT_FOUND');
	}
} else {
	new Error('UNAUTH', 'Invalid authentication');
}

exit();
?>