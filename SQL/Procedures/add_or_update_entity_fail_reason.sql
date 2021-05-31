CREATE DEFINER=`root`@`localhost` PROCEDURE `add_or_update_entity_fail_reason`(
	IN failReason VARCHAR(500),
    IN failDescription VARCHAR(1000),
    IN failSeverity TINYINT)
BEGIN
	DECLARE reasonId INT UNSIGNED;
    
    SELECT id INTO reasonId FROM entity_type_fail_reason WHERE fail_reason = failReason;
    
	INSERT INTO entity_type_fail_reason 	(
		`id`, `fail_reason`, `fail_description`, `fail_severity`) 
	VALUES (
		reasonId, failReason, failDescription, failSeverity)
	ON DUPLICATE KEY UPDATE
		fail_reason = failReason,
        fail_description= failDescription,
		fail_severity = failSeverity;
END