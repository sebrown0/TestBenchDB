CREATE DEFINER=`root`@`localhost` PROCEDURE `create_test_case_has_ver`(	
	IN verID INT UNSIGNED, 
	IN rowId INT UNSIGNED, 
    IN testCaseId INT UNSIGNED)
BEGIN
	
	INSERT INTO 
		`test_bench`.`entity_test_has_version` (`version_id`, `entity_test_id`, `entity_test_entity_test_id`)
    VALUES 
		(verID, rowId, testCaseId);
END