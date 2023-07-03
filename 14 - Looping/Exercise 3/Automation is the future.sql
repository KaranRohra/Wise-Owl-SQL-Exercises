USE WorldEvents;
GO

DECLARE @Month INT = 1;
WHILE @Month <= 12
BEGIN
	DECLARE @EventNames VARCHAR(1000) = '';
	SELECT @EventNames += EventName + ', ' FROM tblEvent WHERE MONTH(EventDate) = @Month;

	PRINT 'Events which occurred in ' + DATENAME(MM, CONCAT('2023-', @Month, '-01')) + ': ' + @EventNames;
	SET @Month += 1;
END

