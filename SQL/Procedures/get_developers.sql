CREATE DEFINER=`root`@`localhost` PROCEDURE `get_developers`()
BEGIN
	SELECT 	id, concat(first_name, " ", last_name) AS dev_name 
    FROM 	test_bench.employee 
    WHERE 	employee_type_id = 2;
END