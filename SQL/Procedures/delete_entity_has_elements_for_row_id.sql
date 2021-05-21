CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_entity_has_elements_for_row_id`(
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED)
BEGIN
	DELETE FROM entity_has_element WHERE entity_id = entityRowId AND entity_entity_id = entityId;
END