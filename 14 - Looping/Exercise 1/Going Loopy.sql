USE WorldEvents;
GO

DECLARE @Counter INT = 1981;
DECLARE @EndValue INT = YEAR(GETDATE())

WHILE @Counter <> @EndValue
BEGIN
	DECLARE @EventsCount INT = (SELECT COUNT(*) FROM tblEvent WHERE YEAR(EventDate) = @Counter);

	PRINT CONCAT(@EventsCount, ' events occurred in ', @Counter);
	SET @Counter = @Counter + 1;
END