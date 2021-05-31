SELECT * FROM test_bench.entity_test_result ORDER BY id DESC;
SELECT * FROM test_bench.entity_test_result where id = 77;
SELECT * FROM test_bench.entity_test_result where entity_test_id = 77;
SELECT * FROM test_bench.entity_test_result where id IN (65,66,80,81,106,112,186,187,189);
CALL get_test_results_for_run_by_category(3,'NR');

UPDATE test_bench.entity_test_result SET  fail_severity = 2 where id IN(189);
UPDATE test_bench.entity_test_result SET  comments = '' where comments = 'Test Complete Notes';
DELETE FROM test_bench.entity_test_result WHERE id >= 292;

SET @tr_id = (SELECT max(tr_res.id) FROM test_run_result tr_res WHERE tr_res.test_run_id = 3);

-- Failed
SELECT 		ts.test_suite_name, 
			tst.entity_test_name, tst.last_run_date, tst.last_run_time, res.* 
FROM 		entity_test_result res
INNER JOIN 	entity_test tst
		ON 	tst.id = res.entity_test_id
INNER JOIN 	test_suite_has_entity_test ts_has_tst
		ON 	ts_has_tst.entity_test_id = tst.id
INNER JOIN 	test_suite ts
		ON 	ts.id = ts_has_tst.test_suite_row_id
WHERE 		test_run_result_id = @tr_id AND res.test_passed = 'FAIL'
ORDER BY 	tst.id, ts.test_suite_name ;


-- Passed
SELECT 		ts.test_suite_name, 
			tst.entity_test_name, tst.last_run_date, tst.last_run_time, res.* 
FROM 		entity_test_result res
INNER JOIN 	entity_test tst
		ON 	tst.id = res.entity_test_id
INNER JOIN 	test_suite_has_entity_test ts_has_tst
		ON 	ts_has_tst.entity_test_id = tst.id
INNER JOIN 	test_suite ts
		ON 	ts.id = ts_has_tst.test_suite_row_id
WHERE 		test_run_result_id = @tr_id 
ORDER BY 	res.test_passed;


SELECT 		res.test_passed, count(*)
FROM 		entity_test_result res
WHERE 		test_run_result_id = @tr_id 
group BY 	res.test_passed;

/*
SELECT * FROM test_bench.entity_test_result ;
SELECT * FROM test_bench.entity_test_result where id = 128;
SELECT * FROM test_bench.entity_test_result where test_passed = 'QP';
SELECT * FROM test_bench.entity_test_result where entity_test_id = 77;
SELECT * FROM test_bench.test_run_result;
UPDATE entity_test_result SET test_passed = 'QP' WHERE entity_test_id IN(15,49,61,73,86,113,52,53,63,65,66,69,88,90,92);



update test_bench.entity_test_result set test_run_result_id = 6, test_run_result_test_run_id = 3 where id > 62;

SET @tr_id = (SELECT max(tr_res.id) FROM test_run_result tr_res WHERE tr_res.test_run_id = 3);

SELECT 		ts.test_suite_name, tst.* , res.* 
FROM 		entity_test_result res
INNER JOIN entity_test tst
		ON tst.id = res.entity_test_id
INNER JOIN test_suite_has_entity_test ts_has_tst
		ON ts_has_tst.entity_test_id = tst.id
INNER JOIN test_suite ts
		ON ts.id = ts_has_tst.test_suite_row_id
WHERE test_run_result_id = @tr_id;

SELECT 		TST.ID AS tst_id,res.* 
FROM 		entity_test_result res
INNER JOIN entity_test tst
		ON tst.id = res.entity_test_id
INNER JOIN test_suite_has_entity_test ts_has_tst
		ON ts_has_tst.entity_test_id = tst.id
INNER JOIN test_suite ts
		ON ts.id = ts_has_tst.test_suite_row_id
WHERE 		test_run_result_id = @tr_id AND tst.id IN (15,49,61,73,86,113,52,53,63,65,66,69,88,90,92);



































-- SELECT * FROM test_bench.entity_test_result where id > 62;
-- SELECT * FROM test_bench.test_run_result;

SET @TEST_RUN_ID_FOR_THIS_QUERY = 3;
WITH RECURSIVE test_suite_has_child_suites (test_suite_row_id, test_suite_id) AS (
		SELECT 		id AS test_suite_row_id, test_suite_id
		FROM 		test_suite 
		WHERE 		id IN(
						SELECT 		ts.id
						FROM 		test_run tr
						INNER JOIN 	test_run_has_test_suite tr_has_ts
								ON 	tr_has_ts.test_run_id = tr.id
						INNER JOIN 	test_suite ts
								ON 	ts.id = tr_has_ts.test_suite_row_id AND ts.test_suite_id = tr_has_ts.test_suite_id
						WHERE 		tr.id = @TEST_RUN_ID_FOR_THIS_QUERY
					)
		UNION ALL
		SELECT 		chld.id, chld.test_suite_id
		FROM 		test_suite chld
		INNER JOIN 	test_suite_has_child_suites c
				ON 	c.test_suite_row_id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
	)
	SELECT 			tst.* /*ts.test_suite_name AS 'Test Suite',	-- DISTINCT tst.entity_test_name AS 'Test Case', 
					test_res.id, test_res.test_passed, test_res.test_ignored, test_res.comments, 
					tst.last_run_date, tst.last_run_time, tst.description
					-- get_ver_num(test_has_version.version_id) AS `version_number` 
                    
                    -- id, result_timestamp, , , , entity_test_id, entity_test_entity_test_id, entity_test_entity_id, entity_test_entity_entity_id*/
	FROM 			test_suite_has_child_suites ts_has_chld
	INNER JOIN 		test_suite_has_entity_test ts_has_test
			ON 		ts_has_chld.test_suite_row_id = ts_has_test.test_suite_row_id AND ts_has_chld.test_suite_id = ts_has_test.test_suite_id	
	INNER JOIN 		entity_test tst
			ON 		tst.id = ts_has_test.entity_test_id
	INNER JOIN 		entity_test_result test_res
			ON		tst.id=test_res.entity_test_id; /*AND test_res.entity_test_entity_test_id = tst.entity_test_id;/*
	