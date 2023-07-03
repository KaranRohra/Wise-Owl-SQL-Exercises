USE WorldEvents;


GO
CREATE VIEW vwEverything
AS
SELECT
	CA.CategoryName,
	CT.ContinentName,
	CY.CountryName,
	E.EventName,
	E.EventDate

FROM
	tblEvent AS E 
	INNER JOIN tblCountry AS CY ON CY.CountryID = E.CountryID
	INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID
	INNER JOIN tblCategory AS CA ON CA.CategoryID = E.CategoryID;



GO
SELECT 
	CategoryName,
	COUNT(*) AS [NumberEvents]

FROM 
	vwEverything

WHERE
	ContinentName = 'AFRICA'

GROUP BY
	CategoryName

ORDER BY
	NumberEvents DESC;