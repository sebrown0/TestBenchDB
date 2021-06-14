CREATE DEFINER=`root`@`localhost` PROCEDURE `get_next_entity_status`(IN statusId INT UNSIGNED)
BEGIN
	WITH cte AS (
		SELECT 		issue_status_id 
		FROM 		issue_status is1
		WHERE		is1.status_id = statusId
	)	SELECT 		is2.phase, is2.status_id, is2.status, is2.status_description, is2.issue_status_id 
		FROM 		cte
		INNER JOIN 	issue_status is2
		ON			is2.status_id = cte.issue_status_id
        GROUP BY 	is2.status_id;
END