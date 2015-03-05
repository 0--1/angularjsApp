<?php

class Output {

	public static function toJSON($output) {
		return json_encode($output, JSON_PRETTY_PRINT);
	}
}

?>