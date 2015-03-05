<?php

class Authenticate {
	private $db;
	private $email;

	function __construct($_db) {
		$this->db = $_db;
	}

	public function login($email, $pass, $db) {
		$this->email = $email;
		$query = "SELECT user.user_id FROM user, auth_info WHERE user.user_id=auth_info.user_id AND email='$email' AND hash='" . hash('sha512', $pass) . "'";
		$result = $this->db->execute($query);

		if(isset($result[0]['user_id'])) {
			$this->setKey($result[0]['user_id']);
		} else {
			new Error('UNAUTH', 'Invalid authentication');
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
	}

	public function verifyUser() {}
}

?>