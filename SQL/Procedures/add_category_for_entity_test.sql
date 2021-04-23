CREATE DEFINER=`root`@`localhost` PROCEDURE `add_category_for_entity_test`(
	IN catId INT UNSIGNED, 
    IN catLevel TINYINT,
	IN entityTestId INT UNSIGNED, 
	IN entityId INT UNSIGNED, 
    IN nextVersionId INT UNSIGNED)
BEGIN  
	INSERT INTO `test_bench`.`entity_test_has_one_or_more_test_categories` 
		(`entity_test_id`, `entity_test_entity_id`, `entity_test_entity_test_version_id`, `entity_test_category_id`, `category_level`) 
    VALUES  
		(entityTestId, entityId, nextVersionId, catId, catLevel); 
END