CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_place_holder`(
	IN placeHolderName VARCHAR(100),     
	IN placeHolderTypeName VARCHAR(100))
BEGIN
	DECLARE placeHolderTypeId INT UNSIGNED;
    DECLARE placeHolderId INT UNSIGNED DEFAULT 0;
    DECLARE nextId INT UNSIGNED DEFAULT 0;
    
    SELECT id INTO placeHolderTypeId FROM place_holder_type WHERE place_holder_type_name = placeHolderTypeName;
    SELECT id INTO placeHolderId FROM place_holders WHERE place_holder_type_name = placeHolderTypeName AND place_holder_name = placeHolderName;
    SELECT max(id)+1 INTO nextId FROM place_holders;
    
    IF placeHolderId IS NULL OR placeHolderId <= 0 THEN
		INSERT INTO 
			`test_bench`.`place_holders` (`id`, `place_holder_name`, `place_holder_type_id`, `place_holder_type_name`)
		VALUES 	
			(nextId, placeHolderName, placeHolderTypeId, placeHolderTypeName);
	END IF;
END