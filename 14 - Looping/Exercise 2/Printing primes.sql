DECLARE @Prime INT = 2;
DECLARE @StartTime DATETIME = CURRENT_TIMESTAMP;
DECLARE @EndTime DATETIME;

WHILE @Prime <= 1000
BEGIN
	DECLARE @num INT = 2;
	DECLARE @IsPrime INT = 1;
	DECLARE @HighestFact INT = FLOOR(SQRT(@Prime))

	WHILE @num < @HighestFact
	BEGIN
		IF @Prime % @num = 0
		BEGIN
			SET @IsPrime = 0;
			BREAK;
		END

		SET @num += 1;
	END

	IF @IsPrime = 1
	BEGIN
		PRINT @Prime
	END

	SET @Prime += 1;
END

SET @EndTime = CURRENT_TIMESTAMP;

PRINT CONCAT('Total time taken ', DATEDIFF(ms, @StartTime, @EndTime), 'ms');