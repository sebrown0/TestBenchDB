CREATE DEFINER=`root`@`localhost` PROCEDURE `add_or_update_entity_has_fail_reason`(
	IN entityTypeId INT UNSIGNED, 
    IN entityTypeName VARCHAR(500), 
    IN entityTypeFailReasonId INT UNSIGNED, 
    IN isPrimaryReason TINYINT)
BEGIN
	DECLARE existingId INT UNSIGNED;
    DECLARE idThatIsPrimaryReason INT UNSIGNED;
        
    -- Get existing fail reason id if available
    SELECT 	id 
    INTO	existingId
    FROM 	entity_type_has_fail_reason 
    WHERE 	entity_type_name = entityTypeName AND entity_type_fail_reason_id = entityTypeFailReasonId;
    
    SELECT 	id 	
    INTO 	idThatIsPrimaryReason
    FROM 	entity_type_has_fail_reason WHERE entity_type_name = entityTypeName AND is_primary_reason = 1;
    
    IF NOT idThatIsPrimaryReason IS NULL AND idThatIsPrimaryReason <> existingId THEN
		-- Remove existing primary reason
		UPDATE 	entity_type_has_fail_reason 
		SET 	is_primary_reason = 0 
		WHERE 	entity_type_name =  entityTypeName;
    END IF;
    
	INSERT INTO entity_type_has_fail_reason (
		`id`, `entity_type_id`, `entity_type_name`, `entity_type_fail_reason_id`, `is_primary_reason`) 
	VALUES (
		existingId, entityTypeId, entityTypeName, entityTypeFailReasonId, isPrimaryReason)
	ON DUPLICATE KEY UPDATE
		is_primary_reason = isPrimaryReason;
END