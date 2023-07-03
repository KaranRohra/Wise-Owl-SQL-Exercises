USE WorldEvents;
GO

SELECT
	CY.CountryName

FROM
	tblCountry AS CY

WHERE
	(SELECT COUNT(*) FROM tblEvent WHERE CountryID = CY.CountryID) > 8

ORDER BY 
	CY.CountryName;


