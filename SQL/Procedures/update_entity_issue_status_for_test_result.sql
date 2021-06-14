CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_issue_status_for_test_result`(IN forTestStatus VARCHAR(20), IN setStatus TINYINT)
BEGIN
	-- Set the issue status of an entity with a entity_test_result.test_passed
	WITH cte AS (
		SELECT 	ent.id
		FROM 	entity ent
		JOIN	entity_test test
		ON		ent.id = test.entity_id AND ent.entity_id = test.entity_entity_id
		JOIN	entity_test_result res
		ON		res.entity_test_entity_id = ent.id AND res.entity_test_entity_entity_id = ent.entity_id
		WHERE 	res.test_passed = forTestStatus -- Pass, Fail etc
)		UPDATE 	entity 
		SET 	issue_status_id = setStatus 	-- issue_status.id
		WHERE 	id IN (SELECT * FROM cte);
END