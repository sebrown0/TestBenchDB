CREATE DEFINER=`root`@`localhost` FUNCTION `test_run_has_test_suite`(
	testRunIdIn INT UNSIGNED,	
    testSuiteId INT UNSIGNED,
    testSuiteVersionId INT UNSIGNED) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE c INT;
    DECLARE ret BOOLEAN DEFAULT FALSE;
    
    SELECT count(test_run_id) 
    INTO 		c
    FROM 		test_run_has_test_suite 
    WHERE 		test_run_id = testRunIdIn AND test_suite_id = testSuiteId AND  test_suite_version_id = testSuiteVersionId
    GROUP BY 	test_run_id;
    
    IF c > 0 THEN SET ret = TRUE; END IF;
	RETURN ret;
END