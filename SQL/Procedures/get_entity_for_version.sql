CREATE DEFINER=`root`@`localhost` PROCEDURE `get_entity_for_version`(
	IN entityId INT UNSIGNED,
    IN mj INT UNSIGNED,
    IN mn INT UNSIGNED,
    IN bl INT UNSIGNED)
BEGIN	
	SELECT 		ent.*
	FROM 		test_bench.entity ent
	INNER JOIN	entity_has_version has_ver
			ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
	INNER JOIN 	version ver 
			ON 	ver.id = has_ver.version_id
	WHERE 		ent.entity_id = entityId AND ver.major = mj AND ver.minor = mn AND ver.build = bl;
END