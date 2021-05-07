CREATE DEFINER=`root`@`localhost` PROCEDURE `get_version_for_entity`(IN entityRowId INT UNSIGNED)
BEGIN
	SELECT 		ver.major, ver.minor, ver.build
	FROM 		test_bench.entity ent
	INNER JOIN	entity_has_version has_ver
			ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
	INNER JOIN 	version ver 
			ON 	ver.id = has_ver.version_id
	WHERE 		ent.id = entityRowId;
END