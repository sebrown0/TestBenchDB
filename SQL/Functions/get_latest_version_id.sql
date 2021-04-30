CREATE DEFINER=`root`@`localhost` FUNCTION `get_latest_version_id`(entityId INT UNSIGNED) RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN
	DECLARE latestVerId INT DEFAULT 0;
    
	SELECT entity_version_id INTO latestVerId 
    FROM test_bench.entity WHERE entity_id = entityId 
    ORDER BY entity_version_id DESC LIMIT 1;
    
    RETURN latestVerId;
END