SELECT * FROM test_bench.entity;
SELECT * FROM test_bench.entity_help;
SELECT * FROM test_bench.entity_details;
SELECT * FROM test_bench.entity_action;
SELECT * FROM test_bench.entity_can_have_action;
SELECT * FROM test_bench.version;
SELECT * FROM test_bench.entity_has_version;

call get_version_info_for_entity(1);

SET foreign_key_checks = 0;
SET @rId = get_next_entity_row_id();
SET @eId = get_next_entity_id();

SET @rId = 1;
SET @eId = 1;

-- id, entityId, entityName, entityDetailsId, entityTypeName, entityHelpId, entityParentId, entityParentEntityId
CALL create_or_update_entity(@rId, @eId , 'rootER', NULL, 'Root', 1,null,null);
CALL create_or_update_entity_help(@rId ,@eId ,'TRUE','DONE - ADD TOOL TIP TEXT',null,null);	
CALL create_or_update_entity_details(@rId, @eId ,'desc dets','MAN', null,null);
CALL create_or_update_entity_action(@rId, @eId, 1, 'desc action', 'data');		
CALL create_or_update_entity_version(@rId, @eId , 'root', 'ver notes.', 1,1,0,null);
SET foreign_key_checks = 1;

CALL get_enity_row_id_for_entity_version('1','1','0','0');

-- Ent 	-> entityRowId, entityId, entityName, entityTypeName, entityParentId, entityParentEntityId
-- Help -> hasToolTip, toolTipText, helpFileName, helpText, 
-- Det	-> entityDesc, creationType, lastTestedDate, lastTestedTime
-- Act	-> entityActionTypeId, entityActionDesc, entityActionData
-- Ver	-> versionNote, mjr, mnr, bld, versionTodoId

CALL create_or_update_all_entity_details(
		1, 1, 'rootER', NULL, 'Root', 1, null, null,
        'TRUE', 'DONE - ADD TOOL TIP TEXT', null, null,
        'A TEST DESC','MAN', NULL, NULL, -- NOW(), NOW(), 
        1, 'desc action', 'data',
        'ver notes.', 1, 1, 0, null);

CALL create_or_update_all_entity_details('1','1','rootER','0','Root','0','0','0','True','DONE - ADD TOOL TIP TEXT','','','ent desc ???????','MAN','1900-01-01','00:00:00','0','','','','1','1','0','0');

SELECT 		ver.major, ver.minor, ver.build
FROM 		test_bench.entity ent
INNER JOIN	entity_has_version has_ver
		ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
INNER JOIN 	version ver 
		ON 	ver.id = has_ver.version_id
WHERE 		ent.id = 1;
CALL get_version_for_entity(22);

-- Get entity row id for entity_id and version
SELECT 		*
FROM 		test_bench.entity ent
INNER JOIN	entity_has_version has_ver
		ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
INNER JOIN 	version ver 
		ON 	ver.id = has_ver.version_id
WHERE 		ent.entity_id = 1 AND ver.major = 1 AND ver.minor = 0 AND ver.build = 0;
CALL get_entity_for_version(1,2,0,0);
CALL get_enity_row_id_for_entity_version(1,2,0,0);
CALL get_version_info_for_entity(1);

SELECT 		ent.id, ent.entity_id, ver.major, ver.minor, ver.build 
FROM 		test_bench.entity ent
INNER JOIN	entity_has_version has_ver
		ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
INNER JOIN 	version ver 
		ON 	ver.id = has_ver.version_id
WHERE 		ent.entity_id;

call get_entity_with_details(1,1);	

CALL get_version_info_for_entity(1);

SET foreign_key_checks = 0;
INSERT INTO `test_bench`.`entity` (`id`, `entity_id`, `entity_name`, `entity_type_details_id`, `entity_type_id`, `entity_type_entity_type_name`, `entity_help_id`, `parent_id`, `parent_entity_id`)
VALUES (2, 1, 'root', 1, 1, 'Root', 1, NULL, NULL);
SET foreign_key_checks = 1;

