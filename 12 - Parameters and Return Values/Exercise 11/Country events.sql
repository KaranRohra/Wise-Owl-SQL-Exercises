USE WorldEvents;
GO

ALTER PROC spEventsAndCountries (
	@CountryName VARCHAR(50)
)
AS
SELECT
	EV.EventName,
	EV.EventDate,
	CY.CountryName

FROM
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID

WHERE
	CY.CountryName LIKE  '%' + @CountryName + '%'
GO

EXEC spEventsAndCountries @CountryName= 'indi';