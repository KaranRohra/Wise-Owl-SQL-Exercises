USE WorldEvents;

GO
ALTER PROC uspCountriesAsia
AS
SELECT
	CountryName

FROM
	tblCountry

WHERE 
	ContinentID = 1

ORDER BY
	CountryName;


GO
EXEC uspCountriesAsia;


