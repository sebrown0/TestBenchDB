CREATE DEFINER=`root`@`localhost` PROCEDURE `get_last_run_test_and_test_run`()
BEGIN
	SELECT 		test.id AS test_id, test.entity_test_name, test.last_run_date AS test_last_run,
				run.id AS test_run_id, run.test_run_name, run.comments
	FROM 		entity_test 
				test
	JOIN		test_suite_has_entity_test 
				ts_has_test
	ON			test.id = ts_has_test.entity_test_id
	JOIN		test_run_has_test_suite
				tr_has_ts
	ON			tr_has_ts.test_suite_row_id = ts_has_test.test_suite_row_id
	JOIN		test_run 
				run
	ON			run.id = tr_has_ts.test_run_id
	GROUP BY 	test.last_run_date
	ORDER BY 	test.last_run_date DESC
	LIMIT 		1;
END