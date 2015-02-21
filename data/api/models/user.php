<?php

class User {
	private $url = array();
	private $method = 'get';
	private $data = null;
	private $structure;

	function __construct($_url, $_method, $_data) {
		$this->url = $_url;
		$this->method = strtolower($_method);
		$this->data = $_data;
		global $user_structure;
		$this->structure = $user_structure;

		switch($this->method) {
			case 'get': $this->getUser(); break;
			case 'post': $this->createUser(); break;
			case 'put': $this->modifyUser(); break;
			case 'delete': $this->deleteUser(); break;
		}
	}

	private function createUser() {
		$db = new Database();
		$query = QueryGenerator::insert($this->data, $this->structure, 'user');
		echo $query;
		// $result = $db->execute('show databases');
		// echo $result;
		exit();
		// new Error('NOT_FOUND', 'Database connection error');
	}
}

?>