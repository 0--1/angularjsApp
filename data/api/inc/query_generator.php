<?php


class QueryGenerator {

	public static function insert($data, $structure, $table) {
		$query = 'INSERT INTO ' . $table .' (';
		$values = '(';

		try {
			foreach ($structure as $index => $meta) {
				$query .= $meta['field'] . ', ';
				$values .= '';
			}
		} catch(Exception $e) {
			new Error('INTERNAL_ERROR', 'Error creating insert query: ' . $e->getMessage());
		}

		return $query;
	}
}

?>