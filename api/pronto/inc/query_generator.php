<?php


class QueryGenerator {

	public static function insert($data, $structure, $table) {
		$sortedData = array();
		$fields = array();
		$values = array();

		$query = 'INSERT INTO ' . $table .' (';

		try {
			foreach ($structure as $index => $info) {
				$tempData = null;

				if (isset($data[$info['meta']['client']])) {
					$tempData = $data[$info['meta']['client']];
				} else {
					if($info['meta']['required'] === "true") {
						throw new Exception('Value for ' . $info['meta']['client'] . ' is required, but not provided: ' . !isset($tempData));
					} else {
						$tempData = $info['meta']['default'];
					}
				}

				$fields[] = $info['field'];
				$sortedData[] = ($tempData === 'NOW()' || $tempData === 'NULL') ? $tempData : "'$tempData'";
			}
			$query .= implode(',', $fields) . ') VALUES (' . implode(',', $sortedData) . ')' ;
		} catch(Exception $e) {
			new Error('INTERNAL_ERROR', 'Error creating insert query: ' . $e->getMessage());
		}

		return $query;
	}

	public static function select($id, $structure, $table) {
		$fields = array();
		$query = 'SELECT ';

		foreach ($structure as $index => $info) {
			$fields[] = $info['field'];
		}

		$query .= implode(',', $fields) . ' FROM ' . $table;

		if(!is_null($id)) {
			$query .= ' WHERE ' . $fields[0] . '=' . $id;
		}

		return $query;
	}
}

?>