CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_all_entity_details`(	
	-- Entity
	IN entityRowId INT UNSIGNED, 
	IN entityId INT UNSIGNED, 
	IN entityName VARCHAR(250),     
    IN entityDetailsId INT UNSIGNED, 
	IN entityTypeName VARCHAR(45),     
    IN entityHelpId INT UNSIGNED, 
    IN entityParentId INT UNSIGNED,
    IN entityParentEntityId INT UNSIGNED,        
    IN isElement TINYINT,
    -- Help
    IN hasToolTip VARCHAR(5),
	IN toolTipText VARCHAR(500), 
	IN helpFileName VARCHAR(250), 
	IN helpText TEXT,
    -- Details
    IN entityDesc TEXT, 
    IN creationType ENUM('AUTO', 'MAN'),
    IN lastTestedDate DATE, 
    IN lastTestedTime TIME, 
    -- Action
    IN entityActionTypeId INT UNSIGNED,
    IN entityActionDesc VARCHAR(500), 
    IN entityActionFunc VARCHAR(250), 
    IN entityActionDataIn TEXT,
    IN entityActionDataOut TEXT,
    IN entityActionDataExpected TEXT,
    -- Version
    IN versionNote TEXT,
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED
    )
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT "FAILED TO CREATE ENTITY";
        SET autocommit = 1;
	END;
    
    SET autocommit = 0;
    START TRANSACTION;		
	CALL create_or_update_entity_details(entityRowId, entityId , entityDesc, creationType, lastTestedDate, lastTestedTime);
    CALL create_or_update_entity(entityRowId, entityId , entityName, get_entity_details_id_for_entity(entityRowId), entityTypeName, entityHelpId, entityParentId, entityParentEntityId, isElement);	
    CALL create_or_update_entity_help(entityRowId ,entityId , hasToolTip, toolTipText, helpFileName, helpText);		
	CALL create_or_update_entity_action(entityRowId, entityId, entityActionTypeId, entityActionDesc, entityActionFunc, entityActionDataIn, entityActionDataOut, entityActionDataExpected);		
	CALL create_or_update_entity_version(entityRowId, entityId , entityName, versionNote, mjr, mnr, bld);    
	-- COMMIT;
    SELECT "ADDED OR UPDATED ENTITY";
    SET autocommit = 1;
END