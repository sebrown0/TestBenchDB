SELECT * FROM test_bench.entity WHERE is_element = 1;
SELECT count(*) FROM test_bench.element;
SELECT * FROM test_bench.entity_has_element;
DELETE FROM test_bench.entity_has_element where entity_id=147;

-- CALL create_or_update_entity_as_element(9018,9018,1);

select get_max_element_id();
select get_element_id(9001,9001);

SELECT element_id  FROM entity_has_element WHERE element_entity_row_id = 9001 AND element_entity_id = 9001;
CALL create_or_update_all_entity_details('9002','9002','JSPanel Header','0','JSHeader','0','9000','9000','0','False','-','','','','MAN','1900-01-01','00:00:00','9','JSHeader','Element','-','-','-','','1','0','0');

select get_entity_details_id(9002, 9002);  
select get_entity_help_id(9002, 9002);  

CALL create_or_update_entity_has_element(147,147,2);
call delete_entity_has_elements_for_row_id('147','147');
CALL create_or_update_entity_has_element('147','147',9004);

SELECT count(*) FROM test_bench.entity;
SELECT * FROM test_bench.element;
    

		INSERT INTO `test_bench`.`entity_has_element` (
			`entity_id`, `entity_entity_id`, `element_id`, `element_entity_row_id`, `element_entity_id`) 
		VALUES (
			147, 147, 5, 9005, 9005);