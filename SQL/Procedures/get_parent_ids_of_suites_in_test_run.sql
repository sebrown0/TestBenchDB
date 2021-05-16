CREATE DEFINER=`root`@`localhost` PROCEDURE `get_parent_ids_of_suites_in_test_run`(IN testRunId INT UNSIGNED)
BEGIN
	SELECT 		ts.parent_id 
	FROM 		test_run tr
	INNER JOIN 	test_run_has_test_suite tr_has_ts
			ON 	tr_has_ts.test_run_id = tr.id
	INNER JOIN 	test_suite ts
			ON 	ts.id = tr_has_ts.test_suite_row_id AND ts.test_suite_id = tr_has_ts.test_suite_id
	WHERE 		tr.id = testRunId;
END