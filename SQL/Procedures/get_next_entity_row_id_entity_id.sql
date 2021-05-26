CREATE DEFINER=`root`@`localhost` PROCEDURE `get_next_entity_row_id_entity_id`()
BEGIN
	DECLARE rowId INT UNSIGNED;
    DECLARE entId INT UNSIGNED;
    
	SELECT 		max(id) 
    INTO 		rowId
	FROM 		test_bench.entity 
	WHERE 		id < 9000
	ORDER BY 	id DESC LIMIT 1;
    
    IF rowId = NULL THEN SET rowId = 0; END IF;
    
    SELECT 		max(entity_id) 
    INTO 		entId
	FROM 		test_bench.entity 
	WHERE 		id < 9000
	ORDER BY 	id DESC LIMIT 1;
    
    IF entId = NULL THEN SET entId = 0; END IF;
   
	SELECT rowId+1 AS row_id, entId+1 AS entity_id;
	
END