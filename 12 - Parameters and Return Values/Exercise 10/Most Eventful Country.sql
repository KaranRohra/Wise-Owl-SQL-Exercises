USE WorldEvents;
GO

ALTEr PROC spMostEventCountry(
	@CountryName VARCHAR(50) OUTPUT,
	@NumberOfEvents INT OUTPUT
) AS
SELECT TOP 1
	@CountryName = CY.CountryName,
	@NumberOfEvents = COUNT(*)

FROM
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID

GROUP BY
	CY.CountryName

ORDER BY
	COUNT(*) DESC;
GO


DECLARE @TopCountry VARCHAR(30);
DECLARE @EventCount INT;

EXEC spMostEventCountry
	@CountryName = @TopCountry OUTPUT,
	@NumberOfEvents = @EventCounT OUTPUT;


SELECT @TopCountry AS [Country Name], @EventCount AS [Number of Events];
