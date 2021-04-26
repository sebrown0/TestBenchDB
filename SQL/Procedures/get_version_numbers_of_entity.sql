CREATE DEFINER=`root`@`localhost` PROCEDURE `get_version_numbers_of_entity`(
	IN entityId INT UNSIGNED)
BEGIN
	SELECT 
		et.id, et.entity_name,
		ver.major, ver.minor, ver.build
	FROM 
		test_bench.entity et
	INNER JOIN entity_has_version has_ver
			ON et.id = has_ver.entity_id AND et.entity_version_id = has_ver.entity_entity_version_id
			INNER JOIN version ver 
					ON ver.id = has_ver.version_id
	WHERE et.id = entityId;
END