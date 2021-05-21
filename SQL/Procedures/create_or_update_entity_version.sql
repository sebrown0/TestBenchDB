CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_version`(			
	IN entityRowId INT UNSIGNED, 
    IN entityEntityId INT UNSIGNED, 
    IN entityName VARCHAR(200),
    IN versionNote TEXT,
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED)
BEGIN
	DECLARE hasVer BOOL;
    DECLARE versionId INT UNSIGNED;
    
    SET hasVer = get_entity_has_ver(entityRowId, entityEntityId, mjr, mnr, bld);
    SET versionId = hasVer;
    CALL create_or_update_version(versionId, entityRowId, entityEntityId, entityName, versionNote, 'ENTITY', mjr, mnr, bld);    
    IF hasVer IS NULL OR hasVer <= 0 THEN    
		CALL create_entity_has_ver(versionId, entityRowId, entityEntityId);	
    END IF;        
END