<?php

class Authenticate {
	private $method;
	private $db;
	private $email;

	function __construct($_method, $_db) {
		$this->method = $_method;
		$this->db = $_db;
	}

	public function login($email, $pass, $db) {
		if($this->method === 'post') {
			$this->email = $email;
			$query = "SELECT user.user_id FROM user, auth_info WHERE user.user_id=auth_info.user_id AND email='$email' AND hash='" . hash('sha512', $pass) . "'";
			$result = $this->db->execute($query);

			if(isset($result[0]['user_id'])) {
				$this->setKey($result[0]['user_id']);
			} else {
				new Error('UNAUTH', 'Invalid authentication');
			}
		} else {
			new Error('NOT_FOUND');
		}
	}

	private function generateKey($length = 128) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';

		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}

		return $randomString;
	}

	private function setKey($user_id) {
		$ckey = $this->generateKey();
		$hkey = $this->generateKey();

		$query = "INSERT INTO auth_key (user_id, ckey, hkey) VALUES('$user_id', '$ckey', '$hkey')";
		$this->db->execute($query);

		$expiration = time() + 30*24*60*60;

		setcookie('ckey', $ckey, $expiration);
		setcookie('hkey', $hkey, $expiration);
		setcookie('user_id', $user_id, $expiration);
		setcookie('email', $this->email, $expiration);

		$query = "INSERT INTO auth_log (user_id, ckey, timestamp, type) VALUES ($user_id, '$ckey', NOW(), 'i')";
		$result = $this->db->execute($query);
		return true;
	}

	public function validateLogin() {
		if(isset($_COOKIE['user_id']) && isset($_COOKIE['ckey']) && isset($_COOKIE['hkey'])) {
			$query = "SELECT user_id FROM auth_key WHERE ckey='".$_COOKIE['ckey']."' AND hkey='".$_COOKIE['hkey']."'";
			$result = $this->db->execute($query);
			return $result[0]['user_id'] == $_COOKIE['user_id'];
		} else {
			return false;
		}
	}
}

?>