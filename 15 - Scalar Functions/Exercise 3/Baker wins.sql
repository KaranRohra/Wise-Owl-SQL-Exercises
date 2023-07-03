USE DoctorWho;
GO

ALTER FUNCTION fnReign(
	@start DATETIME,
	@end DATETIME
)
RETURNS INT
AS
BEGIN
	SET @start = 
		CASE
			WHEN @start IS NULL THEN GETDATE()
			ELSE @start
		END;
	SET @end = 
		CASE
			WHEN @end IS NULL THEN GETDATE()
			ELSE @end
		END;
	RETURN DATEDIFF(day, @start, @end)
END
GO


SELECT
	DoctorName,
	dbo.fnReign(FirstEpisodeDate, LastEpisodeDate) AS [Reign in days]

FROM
	tblDoctor

ORDER BY
	[Reign in days] DESC
