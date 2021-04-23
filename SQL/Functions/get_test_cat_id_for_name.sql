CREATE DEFINER=`root`@`localhost` FUNCTION `get_test_cat_id_for_name`(testCatName VARCHAR(45)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE catId INT;
    
    SELECT id INTO catId FROM test_bench.entity_test_category WHERE entity_test_category_name = testCatName;    
    IF catId IS NULL THEN
		SET catId = 1;
    END IF;
	RETURN catId;
END