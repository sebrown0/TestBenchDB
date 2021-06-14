CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_results_for_run_by_category`(
	IN testRunId INT UNSIGNED, 
    IN resCategory VARCHAR(20),
    IN includeParents TINYINT)
BEGIN	
	DECLARE excludedReason VARCHAR(100) DEFAULT 'EXCLUDE_NONE';
    DECLARE excludedText VARCHAR(100) DEFAULT "%!&!";
    
    IF NOT includeParents   THEN -- <= 0
		SET excludedReason = '%Child failed%'; 
        SET excludedText = "%Top Level%"; 
	END IF;    
    
	SELECT 		DISTINCT ts.test_suite_name AS 'In Test Suite', 
				test.entity_test_name AS 'Test Name', test.id AS 'Test ID', test.description AS 'Test Description', test.test_function AS 'Test Function', 
				test.data_in AS 'Data In', test.data_out AS 'Data Out', test.data_expected AS 'Data Expected', 
				concat (test.last_run_date, " - ", test.last_run_time) AS 'Last Run',  
				test_res.id AS 'Result ID', test_res.test_passed AS 'Result', test_res.fail_severity AS 'Fail Severity', 
                test_res.fail_reason AS 'Fail Reason', test_res.comments AS 'Comments',
				stat.id AS 'Issue Status Row ID', stat.phase AS 'Phase', stat.status_id AS 'Status Id', stat.status AS 'Status', 
                stat.status_description AS 'Status Description', stat.issue_status_id AS 'Next Status Id'
    FROM 		test_run_result 
				run_res
	INNER JOIN	entity_test_result 
				test_res
			ON 	test_res.test_run_result_test_run_id = run_res.test_run_id	                
	INNER JOIN 	entity_test
				test
			ON	test.id = test_res.entity_test_id	
	INNER JOIN 	test_suite_has_entity_test 
				ts_has_tst
			ON 	ts_has_tst.entity_test_id = test.id
	INNER JOIN 	test_suite 
				ts
			ON 	ts.id = ts_has_tst.test_suite_row_id    
	INNER JOIN	entity 
				ent 
			ON	ent.id = test.entity_id AND ent.entity_id = test.entity_entity_id
	INNER JOIN	issue_status 
				stat
			ON	stat.id = ent.issue_status_id
	WHERE 		run_res.id = get_max_test_run_result_id_for_tr(testRunId) 
    AND 		test_res.test_passed = resCategory 
    AND 		NOT (test_res.fail_reason LIKE excludedReason OR test.entity_test_name LIKE excludedText)
    ORDER BY 	ts.test_suite_name,test_res.fail_severity, test.id;
  
END