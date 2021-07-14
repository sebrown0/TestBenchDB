CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_version`(			
	IN entityRowId INT UNSIGNED, 
    IN entityEntityId INT UNSIGNED, 
    IN entityName VARCHAR(500),
    IN versionNote TEXT,
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED,
    IN transGroupNum INT UNSIGNED)
BEGIN
    DECLARE versionId INT UNSIGNED DEFAULT 0;
        
    SET versionId = get_entity_has_ver(entityRowId, entityEntityId, mjr, mnr, bld);    
    CALL create_or_update_version(versionId, entityRowId, entityEntityId, entityName, versionNote, 'ENTITY', mjr, mnr, bld, transGroupNum);        
END