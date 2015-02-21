<?php


class Error {
	private $error;

	function __construct($type, $description)	{
		global $headersList;
		
		$this->error = $headersList[$type];

		http_response_code($this->error['code']);

		$output = array('code' => $this->error['code'],
			'message' => $this->error['message']);

		if(isset($description)) {
			$output['description'] = $description;
		}

		echo json_encode($output, JSON_PRETTY_PRINT);
		
		exit();
	}
}

?>