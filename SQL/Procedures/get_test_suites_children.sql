CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_suites_children`(IN testSuiteRowId INT UNSIGNED)
BEGIN
	WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id, test_suite_name, test_suite_notes, parent_id, parent_test_suite_id) AS (
		SELECT 		id, test_suite_id, test_suite_name, test_suite_notes, parent_id, parent_test_suite_id
		FROM 		test_suite 
		WHERE 		parent_id = testSuiteRowId
		UNION ALL
		SELECT 		chld.id, chld.test_suite_id, chld.test_suite_name, chld.test_suite_notes, chld.parent_id, chld.parent_test_suite_id
		FROM 		test_suite chld
		INNER JOIN 	test_suite_has_child_suites c
				ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
	)
	SELECT 			chld.id, chld.test_suite_id, chld.test_suite_name, chld.test_suite_notes, chld.parent_id, chld.parent_test_suite_id, 
					get_ver_num(has_ver.version_id) AS `version_number`
	FROM 			test_suite_has_child_suites chld
	INNER JOIN 		test_suite_has_version has_ver
			ON		has_ver.test_suite_id = chld.id AND has_ver.test_suite_test_suite_id = chld.test_suite_id;
END