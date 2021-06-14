CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_runs`()
BEGIN
	WITH max_ids AS (
	SELECT 		tr_res1.id AS tr_result_id, tr_res1.test_run_id, tr_res1.number_failures, tr_res1.report_issued_date, tr_res1.report_filename
    FROM 		test_run_result tr_res1
	INNER JOIN (
				SELECT 	 tr_res2.test_run_id 
                FROM	 test_run_result tr_res2 
                GROUP BY tr_res2.test_run_id) AS tr_res2
				ON 	tr_res1.id = get_max_test_run_result_id_for_tr(tr_res2.test_run_id)
	)	
    SELECT 		tr.id AS `test_run_id`, max_ids.tr_result_id, tr.test_run_name, tr.comments,
				ts.id AS `test_suite_row_id`, ts.test_suite_id,
				ts.test_suite_name, get_ver_num(ver.id) AS `version_number`,ts.parent_id, ts.parent_test_suite_id, ts.test_suite_notes,
                max_ids.number_failures, max_ids.report_issued_date, max_ids.report_filename 
	FROM 		max_ids
    LEFT JOIN 	test_run tr
	ON			tr.id = max_ids.test_run_id    
    INNER JOIN 	test_run_has_test_suite has_suite
			ON 	tr.id = has_suite.test_run_id	
	INNER JOIN 	test_suite ts
			ON 	ts.id = has_suite.test_suite_row_id AND ts.test_suite_id = has_suite.test_suite_id
	INNER JOIN 	test_suite_has_version has_ver
			ON 	has_ver.test_suite_id = ts.id AND has_ver.test_suite_test_suite_id = ts.test_suite_id
	INNER JOIN 	version ver 
			ON 	ver.id = has_ver.version_id            
    ORDER BY 	tr.id;
	
END