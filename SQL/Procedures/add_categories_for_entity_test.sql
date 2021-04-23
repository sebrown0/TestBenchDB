CREATE DEFINER=`root`@`localhost` PROCEDURE `add_categories_for_entity_test`(
	IN c1 VARCHAR(45), 
    IN c2 VARCHAR(45),
	IN entityTestId INT UNSIGNED, 
	IN entityId INT UNSIGNED, 
    IN nextVersionId INT UNSIGNED)
BEGIN
	DECLARE catId TINYINT;
    
    SET catId = get_test_cat_id_for_name(c1);
	IF catId > 1 THEN
		CALL add_category_for_entity_test(catId, 1, entityTestId, entityId, nextVersionId);
	END IF; 
     
	SET catId = get_test_cat_id_for_name(c2);
    IF catId > 1 THEN  
		CALL add_category_for_entity_test(catId, 2, entityTestId, entityId, nextVersionId);
	END IF;
END