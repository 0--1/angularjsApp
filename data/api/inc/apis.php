<?php
// list of api categories and their corresponding model class
$apis = array(
	'user' =>  'User',
    'emergency' => 'Emergency',
    'scenario' => 'Scenario'
    );


$user_structure = array(
	array('field' => 'user_id', 'meta' => array('transform' => 'id', 'required' => 'true', 'default' => '\'\'')),
	array('field' => 'user_type_id', 'meta' => array('transform' => 'type_id', 'required' => 'true', 'default' => null)),
	array('field' => 'firstname', 'meta' => array('transform' => 'firstname', 'required' => 'true', 'default' => null)),
	array('field' => 'middlename', 'meta' => array('transform' => 'middlename', 'required' => 'false', 'default' => '\'\'')),
	array('field' => 'lastname', 'meta' => array('transform' => 'lastname', 'required' => 'true', 'default' => null)),
	array('field' => 'email', 'meta' => array('transform' => 'email', 'required' => 'true', 'default' => null)),
	array('field' => 'birthdate', 'meta' => array('transform' => 'birthdate', 'required' => 'true', 'default' => null)),
	array('field' => 'timestamp', 'meta' => array('transform' => 'timestamp', 'required' => 'true', 'default' => 'NOW()')),
	array('field' => 'deleted', 'meta' => array('transform' => 'deleted', 'required' => 'true', 'default' => '0')),
	array('field' => 'delete_timestamp', 'meta' => array('transform' => 'delete_timestamp', 'required' => 'false', 'default' => 'NULL')),
	);
?>