SELECT * FROM test_bench.fixed_reason;
SELECT * FROM test_bench.issue_status;

CALL get_next_entity_status(6);
CALL get_next_entity_issue_phase(3);

SELECT 		is2.phase 
FROM 		issue_status is1
JOIN		issue_status is2 
ON			is2.status_id = is1.issue_status_id
WHERE 		is1.status_id = 1
GROUP BY 	is2.phase ;

-- CALL update_entity_issue_status_for_test_result('Fail', 6);

/*
set foreign_key_checks=0;
truncate issue_status;
INSERT INTO `test_bench`.`issue_status` ( `status_id`, `phase`, `status`, `status_description`, `issue_status_id`) 
VALUES 
	(0, 'Initial', 'None', 'The entity has no status', '1'),
	(1, 'Testing', 'Testing', 'The entity is in testing', '2'),
    (1, 'Testing', 'Testing', 'The entity is in testing', '3'),
    (1, 'Testing', 'Testing', 'The entity is in testing', '4'),
    (2, 'Post Test', 'Tested Pass', 'The entity passed testing', '7'),
    (3, 'Post Test', 'Tested Fail', 'The entity failed testing', '5'),
    (4, 'Post Test', 'Tested QP', 'The entity had a qualified pass after testing', '5'),
    (5, 'Investigation', 'Investigation', 'The entity is being investigated.', '6'),
    (6, 'Regression Test', 'Regression Test', 'The entity is being re-tested.', '2'),
    (6, 'Regression Test', 'Regression Test', 'The entity is being re-tested.', '3'),
    (6, 'Regression Test', 'Regression Test', 'The entity is being re-tested.', '4'),
    (7, 'Production', 'Production', 'The entity is fine and can be put into production', '8'),    
    (8, 'Release', 'Release', 'The entity has been released.', '1');
set foreign_key_checks=1;    
    


WITH cte AS (
	SELECT 		issue_status_id 
	FROM 		issue_status is1
	WHERE		is1.status_id = 5
)	SELECT 		is2.status_id, is2.status, is2.status_description, is2.issue_status_id 
	FROM 		cte
	INNER JOIN 	issue_status is2
    ON			is2.status_id = cte.issue_status_id
    GROUP BY 	is2.status_id;
    
