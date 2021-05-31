CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_results_for_run_by_category`(IN testRunId INT UNSIGNED, IN resCategory VARCHAR(20))
BEGIN
	-- Get the last set of results for the TR ID and category.
	DECLARE trResId INT UNSIGNED;
    
	SET trResId = (SELECT max(tr_res.id) FROM test_run_result tr_res WHERE tr_res.test_run_id = testRunId);
    
	SELECT 		ts.test_suite_name AS 'Test Suite', 
				tst.entity_test_name AS 'Test', 
                tst.last_run_date AS 'Last Run Date', tst.last_run_time AS 'Last Run Time', 
                res.id AS 'Result ID', res.result_timestamp AS 'Result Timestamp', 
                res.test_passed AS 'Result', res.fail_severity AS 'Fail Severity', res.comments AS 'Comments', 
                tst.entity_test_id AS 'Test ID'
	FROM 		entity_test_result res
	INNER JOIN 	entity_test tst
			ON 	tst.id = res.entity_test_id
	INNER JOIN 	test_suite_has_entity_test ts_has_tst
			ON 	ts_has_tst.entity_test_id = tst.id
	INNER JOIN 	test_suite ts
			ON 	ts.id = ts_has_tst.test_suite_row_id
	WHERE 		test_run_result_id = trResId AND res.test_passed = resCategory
	ORDER BY 	res.fail_severity, tst.id, ts.test_suite_name;
END