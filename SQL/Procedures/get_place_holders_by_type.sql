CREATE DEFINER=`root`@`localhost` PROCEDURE `get_place_holders_by_type`(IN typeName VARCHAR(45))
BEGIN
	SELECT 		* 
    FROM 		place_holders 
    WHERE 		place_holder_type_name = typeName
	ORDER BY	place_holder_name;
END