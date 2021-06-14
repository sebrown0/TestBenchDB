CREATE DEFINER=`root`@`localhost` PROCEDURE `get_fixed_reasons`()
BEGIN
	SELECT * FROM test_bench.fixed_reason;
END