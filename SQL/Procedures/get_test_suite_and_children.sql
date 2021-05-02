CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_suite_and_children`(IN testSuiteId INT UNSIGNED, IN testSuiteVersionId INT UNSIGNED)
BEGIN
	
	WITH RECURSIVE cteTestSuitesInTestRun (id, test_suite_id, test_suite_version_id) AS (
		SELECT    	ts1.id,
					ts1.test_suite_id, 
					ts1.test_suite_version_id
		FROM      	test_suite ts1  
		WHERE     	ts1.test_suite_version_id = testSuiteVersionId AND ts1.test_suite_id = testSuiteId
		UNION ALL
		SELECT    	ts2.id,
					ts2.test_suite_id, 
					ts2.test_suite_version_id			 
		FROM      	test_suite ts2
		INNER JOIN 	cteTestSuitesInTestRun
				ON 	ts2.test_suite_parent_id = cteTestSuitesInTestRun.test_suite_id
			   AND 	ts2.test_suite_parent_version_id = cteTestSuitesInTestRun.test_suite_version_id
	)
	SELECT 
				ts.test_suite_id, 
				ts.test_suite_version_id,
				ts.test_suite_name, 
				ts.test_suite_notes, 
				ts.test_suite_parent_id,
                get_ver_num(ts.test_suite_version_id) AS `version_number`
	FROM 	   
				cteTestSuitesInTestRun cte
	INNER JOIN 	test_suite ts
			ON 	ts.id = cte.id
	INNER JOIN 	test_suite_has_version has_ver
			ON 	has_ver.test_suite_id = ts.test_suite_id AND has_ver.version_id = ts.test_suite_version_id
	INNER JOIN	version ver
			ON 	ver.id = has_ver.version_id
	ORDER BY 	test_suite_id;
END