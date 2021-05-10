CREATE DEFINER=`root`@`localhost` PROCEDURE `create_test_suite_has_ver`(	
	IN verID INT UNSIGNED, 
	IN rowId INT UNSIGNED, 
    IN testSuiteId INT UNSIGNED)
BEGIN
	INSERT INTO 
		`test_bench`.`test_suite_has_version` (`version_id`, `test_suite_id`, `test_suite_test_suite_id`)
    VALUES 
		(verID, rowId, testSuiteId);
END