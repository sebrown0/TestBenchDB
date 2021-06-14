CREATE DEFINER=`root`@`localhost` PROCEDURE `add_default_entity_type_has_fail_reason`(IN entityTypeId INT UNSIGNED, IN entityTypeName VARCHAR (250))
BEGIN
	INSERT INTO `test_bench`.`entity_type_has_fail_reason` 
		(`entity_type_id`, `entity_type_name`, `entity_type_fail_reason_id`, `is_primary_reason`) 
	VALUES 
		(entityTypeId, entityTypeName, 1, 1), 	-- Child failed	
		(entityTypeId, entityTypeName, 26, 0),	-- Incorrect Functionality    
		(entityTypeId, entityTypeName, 13, 0),	-- App crashes - 1
		(entityTypeId, entityTypeName, 14, 0),	-- App crashes - 2
		(entityTypeId, entityTypeName, 15, 0),	-- Form is unresponsive
		(entityTypeId, entityTypeName, 16, 0);	-- Entity is unresponsive
END