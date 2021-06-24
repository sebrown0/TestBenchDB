SELECT * FROM test_bench.test_run_result;
SELECT * FROM test_bench.entity_test;
SELECT * FROM test_bench.entity_test_result where entity_test_id=115;
SELECT * FROM test_bench.entity_test_result;
SELECT * FROM test_bench.entity_test where id = 10250;
SELECT * FROM test_suite where id = 10006;

SELECT max(tr_res.id) FROM test_run_result tr_res WHERE tr_res.test_run_id = 4;
select get_max_test_run_result_id_for_tr(99);
select get_max_test_run_result_id_for_tr(4);
SELECT get_next_test_run_result_id();

SELECT * FROM entity_test_result_data;
-- DELETE FROM entity_test_result_data;
CALL get_test_results_for_run_by_category(4,'Pass',1);

	SELECT 		DISTINCT ts.test_suite_name AS 'In Test Suite', 
				test.entity_test_name AS 'Test Name', test.id AS 'Test ID', test.description AS 'Test Description', test.test_function AS 'Test Function', 
				test.data_in AS 'Data In', test.data_out AS 'Data Out', test.data_expected AS 'Data Expected', 
				concat (test.last_run_date, " - ", test.last_run_time) AS 'Last Run',  
				test_res.id AS 'Result ID', test_res.test_passed AS 'Result', test_res.fail_severity AS 'Fail Severity', 
                test_res.fail_reason AS 'Fail Reason', test_res.comments AS 'Comments'				
    FROM 		test_run_result 
				run_res
	INNER JOIN	entity_test_result 
				test_res
                ON 	test_res.test_run_result_id = run_res.id AND test_res.test_run_result_test_run_id = run_res.test_run_id	
	INNER JOIN 	entity_test
				test
			ON	test.id = test_res.entity_test_id	
	INNER JOIN 	test_suite_has_entity_test 
				ts_has_tst
			ON 	ts_has_tst.entity_test_id = test.id
	INNER JOIN 	test_suite ts
			ON 	ts.id = ts_has_tst.test_suite_row_id    
	WHERE 		run_res.id = get_max_test_run_result_id_for_tr(4)  AND test_res.test_passed = 'Pass' --  AND test_res.fail_reason <> 'ASSA' -- 'Child failed'
    ORDER BY 	test.id,test_res.fail_severity, ts.test_suite_name;
    
	
    SELECT 	*


    FROM 		test_run_result 
				run_res
	INNER JOIN	entity_test_result 
				test_res
                ON 	test_res.test_run_result_id = run_res.id AND test_res.test_run_result_test_run_id = run_res.test_run_id	
	
	
	WHERE 		run_res.id = 10;
    
    update test_bench.entity_test_result set test_run_result_id = 10 where test_run_result_id= 7 and test_run_result_test_run_id = 4;