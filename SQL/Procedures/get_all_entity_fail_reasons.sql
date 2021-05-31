CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_entity_fail_reasons`()
BEGIN
	SELECT * FROM entity_type_fail_reason;
END