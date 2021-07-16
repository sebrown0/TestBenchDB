SELECT * FROM test_bench.entity;
SELECT count(*) FROM test_bench.entity;
SELECT * FROM test_bench.entity ORDER BY id DESC;
SELECT * FROM test_bench.entity WHERE id < 9000 ORDER BY id DESC;
SELECT * FROM test_bench.entity WHERE id = 10639;				
SELECT * FROM test_bench.entity WHERE id >= 1000 and id <= 1100;			;
SELECT * FROM test_bench.element WHERE entity_row_id = 10119;
SELECT * FROM test_bench.entity WHERE id > 9000 ORDER BY id DESC;
SELECT * FROM test_bench.entity WHERE entity_name = 'Form - Employee Career Details';
SELECT * FROM test_bench.entity_type;
SELECT * FROM test_bench.entity_action;
SELECT * FROM test_bench.entity_action where id = 1254;
SELECT * FROM test_bench.entity_action where entity_id = 1360;
SELECT * FROM test_bench.entity_help;
SELECT * FROM test_bench.entity_help where entity_id = 1405;
SELECT * FROM test_bench.entity_details ORDER BY id DESC;
SELECT * FROM test_bench.entity_details where id = 2001;
SELECT * FROM test_bench.entity_details where ENTITY_id = 1245;
SELECT * FROM test_bench.entity_can_have_action;
SELECT * FROM test_bench.entity_can_have_action where entity_id = 663;
select count(id) from entity; -- 2892
select count(id) from entity_test; -- 2815
select count(id) from entity_test_result; -- 1268

SELECT * FROM test_bench.entity_todo;
SELECT * FROM test_bench.entity WHERE id = 10801;
SELECT * FROM test_bench.entity WHERE entity_id = 331;
SELECT * FROM test_bench.entity_action WHERE entity_id = 9047;
SELECT * FROM test_bench.entity_action WHERE id = 94;
SELECT * FROM test_bench.entity_action WHERE entity_action_data_expected = '#INF#';

select count(id) from entity;
select count(id) from entity_test;
/*
CALL delete_entity_and_tests(1507,1507);

CALL get_entity_with_details(149,149);
select get_entity_details_id(152, 152);    
CALL create_or_update_entity_version(9019,9019,'Container','',1,0,0);
SELECT get_entity_has_ver(9019, 9019, 1, 0, 0);
SET @vID = 0;
CALL create_or_update_version(@vID, 9019, 9019, 'Container', '', 'ENTITY', 1, 0, 0); 

select * from entity e join entity_help h on e.id = h.entity_id and e.entity_help_id = h.id where e.entity_id=30;
call get_version_info_for_entity(1);


ROLLBACK;
SET foreign_key_checks = 0;
DELETE FROM `test_bench`.`entity` WHERE (`id` = '9047') and (`entity_id` = '31');
SET foreign_key_checks = 1;
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

CALL create_or_update_all_entity_details('58','58','Select A Country','58','List','58','49','49','False','-','','','Select employee country','MAN','1900-01-01','00:00:00','6','List: Select A Country. Select from the available list','Display data','-','-','TODO - Enter list of data separated by a ~','','1','0','0');

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

