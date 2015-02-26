<?php

class User {
	private $url = array();
	private $method = 'get';
	private $data = null;
	private $db;

	private $table = 'user';

	private $structure = array(
		array('field' => 'user_id', 'meta' => array('client' => 'id', 'required' => 'false', 'default' => '')),
		array('field' => 'user_type_id', 'meta' => array('client' => 'type_id', 'required' => 'true', 'default' => null)),
		array('field' => 'firstname', 'meta' => array('client' => 'firstname', 'required' => 'true', 'default' => null)),
		array('field' => 'middlename', 'meta' => array('client' => 'middlename', 'required' => 'false', 'default' => '')),
		array('field' => 'lastname', 'meta' => array('client' => 'lastname', 'required' => 'true', 'default' => null)),
		array('field' => 'email', 'meta' => array('client' => 'email', 'required' => 'true', 'default' => null)),
		array('field' => 'birthdate', 'meta' => array('client' => 'birthdate', 'required' => 'false', 'default' => 'NULL')),
		array('field' => 'timestamp', 'meta' => array('client' => 'timestamp', 'required' => 'false', 'default' => 'NOW()')),
		array('field' => 'deleted', 'meta' => array('client' => 'deleted', 'required' => 'false', 'default' => '0')),
		array('field' => 'delete_timestamp', 'meta' => array('client' => 'delete_timestamp', 'required' => 'false', 'default' => 'NULL')),
		);

	function __construct($_url, $_method, $_data, $_db) {
		$this->url = $_url;
		$this->method = strtolower($_method);
		$this->data = $_data;
		$this->db = $_db;

		switch($this->method) {
			case 'get': $this->getUser(); break;
			case 'post': $this->createUser(); break;
			case 'put': $this->modifyUser(); break;
			case 'delete': $this->deleteUser(); break;
		}
	}

	private function createUser() {
		$query = QueryGenerator::insert($this->data, $this->structure, $this->table);
		$id = $this->db->insert($query);
		echo $id . "\n";
		$this->getUser($id);
		exit();
	}

	private function getUser($_id) {
		$id = null;
		if(isset($_id)) {
			$id = $_id;
		} else if(isset($data['user_id'])) {
			$id = $data['user_id'];
		} else {
			new Error('NOT_FOUND', 'No user id is provided.');
		}

		$query = QueryGenerator::select($id, $this->structure, $this->table);
		$result = $this->db->execute($query);
		print_r($result);
	}
}

?>