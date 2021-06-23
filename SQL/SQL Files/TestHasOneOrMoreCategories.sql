SELECT * FROM test_bench.entity_test_has_one_or_more_test_categories;

SELECT 		DISTINCT test.entity_test_name,
			cat.*
FROM 		entity_test_has_one_or_more_test_categories
			tst_has_cat
INNER JOIN	entity_test 
			test
		ON	test.id = tst_has_cat.entity_test_id
INNER JOIN	entity_test_category cat
		ON cat.id = tst_has_cat.entity_test_category_id
ORDER BY	test.entity_test_name;