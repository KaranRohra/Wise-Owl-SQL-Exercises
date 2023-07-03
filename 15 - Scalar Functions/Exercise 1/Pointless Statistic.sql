USE WorldEvents;
GO


ALTER FUNCTION fnLetterCount (
	@First VARCHAR(50),
	@Second VARCHAR(100)
)
RETURNS INT
AS
BEGIN
	RETURN LEN(@First) + LEN(@Second);
END;
GO


SELECT
	EventName,
	EventDetails,
	EventDate,
	dbo.fnLetterCount(EventName, EventDetails) AS [Total Letters]

FROM 
	tblEvent

ORDER BY
	[Total Letters];
