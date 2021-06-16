CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_issue_status_for_result`(IN testCat VARCHAR(10), IN issueStatus INT)
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE entId INT unsigned;
	DECLARE cur CURSOR FOR 
		SELECT 	ent.id
		FROM 	test_bench.entity ent  
        JOIN	entity_test_result res 
        ON 		res.entity_test_entity_id = ent.id 
		WHERE 	test_passed = testCat AND issue_status_id != issueStatus;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    update_loop: LOOP
		FETCH cur INTO entId;
        IF done THEN LEAVE update_loop; END IF;
        UPDATE entity SET issue_status_id = issueStatus WHERE id = entId;
    END LOOP;
    CLOSE cur;
END