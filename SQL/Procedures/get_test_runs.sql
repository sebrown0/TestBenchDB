CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_runs`()
BEGIN
	SELECT 
				tr.id AS `test_run_id`, tr.test_run_name, tr.comments,
				ts.id AS `test_suite_row_id`, ts.test_suite_id, ts.test_suite_version_id, 
				ts.test_suite_name, get_ver_num(ver.id) AS `version_number`,ts.test_suite_parent_id, ts.test_suite_notes
	FROM 		test_run tr
	INNER JOIN 	test_run_has_test_suite has_suite
			ON 	tr.id = has_suite.test_run_id
	INNER JOIN 	test_suite ts
			ON 	ts.test_suite_id = has_suite.test_suite_id AND ts.test_suite_version_id = has_suite.test_suite_version_id
	INNER JOIN 	test_suite_has_version has_ver
			ON 	has_ver.test_suite_id = ts.test_suite_id AND has_ver.version_id = ts.test_suite_version_id
	INNER JOIN 	version ver 
			ON 	ver.id = has_ver.version_id;
END