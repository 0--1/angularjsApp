<?php

foreach (glob("services/*.php") as $filename) {
	include $filename;
}

function __autoload($class_name) {
	include 'models/' . $class_name . '.php';
}

?>