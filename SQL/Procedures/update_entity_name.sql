CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_name`(
	IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED,	
    IN newName VARCHAR(500),
    IN transGroupNum INT UNSIGNED)
BEGIN	
    DECLARE oldName VARCHAR(500);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SET autocommit = 1;
        CALL new_log_entry('ERROR', 'Error updating entity name.', 'update_entity_name', transGroupNum);        
	END;
      
	IF entity_exists_for_row_and_entity_id(entityRowId, entityId) THEN
		SELECT entity_name INTO oldName FROM entity WHERE id = entityRowId AND entity_id = entityId;
		IF oldName != newName THEN
			UPDATE entity SET entity_name = REPLACE (entity_name, oldName, newName) 
			WHERE INSTR(entity_name, oldName) !=0 AND id > 0;
			
			UPDATE entity_test SET entity_test_name = REPLACE (entity_test_name, oldName, newName) 
			WHERE INSTR(entity_test_name, oldName) !=0 AND id > 0;
			
			UPDATE test_suite SET test_suite_name = REPLACE (test_suite_name, oldName, newName) 
			WHERE INSTR(test_suite_name, oldName) !=0 AND id > 0;

			UPDATE version SET entity_name = REPLACE (entity_name, oldName, newName) 
			WHERE INSTR(entity_name, oldName) !=0 AND id > 0;
			
			COMMIT;
			SET autocommit = 1;
			
			CALL new_log_entry('INFO', concat("Updated entity name [", oldName, "] to [", newName, "]." ), 'update_entity_name', transGroupNum);      
		END IF;
	END IF;
END