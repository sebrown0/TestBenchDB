CREATE DEFINER=`root`@`localhost` PROCEDURE `get_entity_test_categories`()
BEGIN
	SELECT * FROM entity_test_category;
END