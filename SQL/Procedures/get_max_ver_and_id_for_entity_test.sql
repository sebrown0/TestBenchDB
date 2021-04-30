CREATE DEFINER=`root`@`localhost` PROCEDURE `get_max_ver_and_id_for_entity_test`(IN entityTestId INT UNSIGNED)
BEGIN
    SELECT 
		ver.id, ver.major, ver.minor, ver.build     
    FROM 
		entity_test_has_version has_ver
	INNER JOIN 
		version ver ON ver.id = has_ver.version_id
	WHERE 
		has_ver.entity_test_id = entityTestId
	ORDER BY 
		ver.major desc, ver.minor desc, ver.build desc
	LIMIT 1;
END