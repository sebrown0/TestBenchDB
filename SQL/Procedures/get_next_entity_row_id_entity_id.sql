CREATE DEFINER=`root`@`localhost` PROCEDURE `get_next_entity_row_id_entity_id`()
BEGIN
	-- Use when we want to add a new entity.
	SELECT  get_next_entity_row_id() AS row_id, get_next_entity_id() AS entity_id;
END