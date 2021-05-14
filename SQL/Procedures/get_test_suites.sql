CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_suites`()
BEGIN
     		
	SELECT		ts.id, ts.test_suite_id, 
				ts.test_suite_name, get_ver_num(ver.id) AS `version_number`, 
                ts.parent_id, ts.parent_test_suite_id, ts.test_suite_notes
	FROM 		test_suite ts		
	INNER JOIN 	test_suite_has_version has_ver
			ON 	has_ver.test_suite_id = ts.id AND has_ver.test_suite_test_suite_id = ts.test_suite_id
	INNER JOIN 	version ver 
			ON 	ver.id = has_ver.version_id
	ORDER BY 	ts.id, ts.test_suite_id, version_number, ts.parent_id;
END