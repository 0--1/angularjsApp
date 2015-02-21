<?php
include 'auth/credentials.php';

class Database {
	private $database;

	function __construct()	{
		global $host;
		global $user;
		global $pass;

		$this->database = new mysqli($host, $user, $pass, 'emda');

		if ($this->database->connect_errno) {
			new Error('INTERNAL_ERROR', 'Database connection failed : (' . $this->database->connect_errno . ') ' . $this->database->connect_error);
		}
	}

	public function execute($query) {
		$output = array();
		$result = $this->database->query($query);

		if($result) {
			while ($row = $result->fetch_assoc()) {
				$output[] = $row;
			}
		} else {
			new Error('INTERNAL_ERROR', 'Database query execution failed : (' . $this->database->errno . ') ' . $this->database->error);
		}

		return json_encode($output, JSON_PRETTY_PRINT);
	}

	public function insert($query) {
		$output = null;
		$result = $this->database->query($query);

		if($result) {
			$output = $this->database->insert_id;
		} else {
			new Error('INTERNAL_ERROR', 'Database query execution failed : (' . $this->database->errno . ') ' . $this->database->error);
		}

		return $output;
	}

	public function close() {
		$this->database->close();
	}
}

?>