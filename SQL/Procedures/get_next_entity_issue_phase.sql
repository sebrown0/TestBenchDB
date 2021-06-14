CREATE DEFINER=`root`@`localhost` PROCEDURE `get_next_entity_issue_phase`(IN statusId INT UNSIGNED)
BEGIN
	SELECT 		is2.phase 
	FROM 		issue_status is1
	JOIN		issue_status is2 
	ON			is2.status_id = is1.issue_status_id
	WHERE 		is1.status_id = statusId
	GROUP BY 	is2.phase ;
END