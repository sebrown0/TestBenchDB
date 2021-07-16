SELECT * FROM entity WHERE id IN (1524,1525,1526);

SET @TEST_RUN_ID_FOR_THIS_QUERY = 100;
CALL get_latest_test_run_report(@TEST_RUN_ID_FOR_THIS_QUERY);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'FAIL',1);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'QP',1);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'NR',1);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'PASS',0);

SELECT 	e.entity_name, e.entity_type_entity_type_name, i.phase, i.status, i.status_description
FROM 	entity e
JOIN 	issue_status i
ON		e.issue_status_id = i.id	
WHERE 	e.id IN (1524,1525,1526);

SELECT 	e.entity_name, e.entity_type_entity_type_name, i.phase, i.status, i.status_description
FROM 	entity e
JOIN 	issue_status i
ON		e.issue_status_id = i.id	
WHERE 	i.status = 'Tested Fail';

SELECT * FROM entity_type;
select count(id) from entity; 
select count(id) from entity_test;
select count(id) from entity_test_result;