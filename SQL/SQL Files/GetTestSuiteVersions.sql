SELECT	ts.id,ts.test_suite_id,ver.* 
FROM	test_suite ts
JOIN 	test_suite_has_version has_ver
ON		ts.id = has_ver.test_suite_id
JOIN 	version ver
ON		ver.id = has_ver.version_id
WHERE	ts.test_suite_id = 10225;

UPDATE Version SET major = 1 WHERE id = 5355;

SELECT * FROM test_suite_has_version WHERE test_suite_test_suite_id = 10670;

WITH cte AS (
SELECT 		ts.test_suite_id -- ts.id ,ts.test_suite_id,ver.* 
FROM 		test_suite ts
JOIN 	test_suite_has_version has_ver
ON			ts.id = has_ver.test_suite_id
JOIN 	version ver
ON			ver.id = has_ver.version_id
WHERE 		ver.major = 2 and ver.version_type = 'TEST_SUITE'
)
SELECT 	ts.id ,ts.test_suite_id,ver.*, c.* 
FROM 	test_suite ts
JOIN 	cte c
ON 		c.test_suite_id = ts.test_suite_id
JOIN 	test_suite_has_version has_ver
ON		ts.id = has_ver.test_suite_id
JOIN 	version ver
ON		ver.id = has_ver.version_id
-- WHERE 	ver.major <> 1
order by ts.test_suite_id
;

-- TEST CASE VERSIONS
SELECT 	*
FROM 	entity_test tst
JOIN 	entity_test_has_version has_ver
ON		tst.entity_entity_id = has_ver.entity_test_entity_test_id
JOIN 	version ver
ON		ver.id = has_ver.version_id
WHERE 	tst.entity_entity_id = 12290;