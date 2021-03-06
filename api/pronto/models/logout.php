<?php

class Logout {
	private $url = array();
	private $method = 'get';
	private $data = null;
	private $db;

	private $table = 'auth_key';

	function __construct($_url, $_method, $_data, $_db) {
		$this->url = $_url;
		$this->method = $_method;
		$this->data = $_data;
		$this->db = $_db;

		// error_log($this->url[0]);

		if($this->method === 'delete' && !isset($this->url[0]) && isset($_COOKIE['uid']) && isset($_COOKIE['ckey']) && isset($_COOKIE['hkey'])) {
			$this->logout();
		} else {
			new Error('NOT_FOUND');
		}

	}

	private function logout() {
		$query = "INSERT INTO auth_log (user_id, ckey, timestamp, type) VALUES (".$_COOKIE['uid'].", '".$_COOKIE['ckey']."', NOW(), 'o')";
		$result = $this->db->execute($query);
		$query = "DELETE FROM $this->table WHERE user_id='".$_COOKIE['uid']."' AND hkey='".$_COOKIE['hkey']."' AND ckey='".$_COOKIE['ckey']."'";
		$result = $this->db->execute($query);
		unset($_COOKIE['ckey']);
		setcookie('ckey', '', time()-3600);
		unset($_COOKIE['hkey']);
		setcookie('hkey', '', time()-3600);
		unset($_COOKIE['email']);
		setcookie('email', '', time()-3600);
		return $result;
	}
}

?>