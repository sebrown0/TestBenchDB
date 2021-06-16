CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_issue_status`(
	IN testPassed ENUM('Pass', 'Fail', 'NR','QP'),
    IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED)
BEGIN
	DECLARE statusId INT;
    
    IF testPassed = 'Pass' THEN
		SET statusId = 5;			
    ELSEIF testPassed = 'Fail' THEN
		SET statusId = 6;
    ELSEIF testPassed = 'NR' THEN
		SET statusId = 3;
    ELSEIF testPassed = 'QP' THEN
		SET statusId = 7;
    ELSE
		SET statusId = 1; 			
    END IF;
    
    UPDATE entity SET issue_status_id = statusId WHERE id = entityRowId AND entity_id = entityId;
END