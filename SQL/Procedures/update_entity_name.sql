CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_name`(
	IN oldName VARCHAR(500),
    IN newName VARCHAR(500))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT "Error changing name!";
        SET autocommit = 1;
	END;
    
	SET autocommit = 0;
    START TRANSACTION;	
    
    UPDATE entity SET entity_name = REPLACE (entity_name, oldName, newName) 
	WHERE INSTR(entity_name, oldName) !=0 AND id > 0;
    
    UPDATE entity_test SET entity_test_name = REPLACE (entity_test_name, oldName, newName) 
	WHERE INSTR(entity_test_name, oldName) !=0 AND id > 0;
    
    UPDATE test_suite SET test_suite_name = REPLACE (test_suite_name, oldName, newName) 
	WHERE INSTR(test_suite_name, oldName) !=0 AND id > 0;

	COMMIT;
    SET autocommit = 1;
END