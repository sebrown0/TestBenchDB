CREATE DEFINER=`root`@`localhost` PROCEDURE `create_entity_has_ver`(	
	IN verID INT UNSIGNED, 
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED)
BEGIN
	
	INSERT INTO `test_bench`.`entity_has_version` 
		(`version_id`, `entity_id`, `entity_entity_id`) 
	VALUES 
		(verID, entityRowId, entityId);
END