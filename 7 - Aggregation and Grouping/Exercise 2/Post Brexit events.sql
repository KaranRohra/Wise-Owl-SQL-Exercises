USE WorldEvents;

GO
SELECT 
	CT.ContinentName AS Continent,
	CY.CountryName AS Country,
	COUNT(*) AS [Numer of events]

FROM 
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID
	INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID

WHERE
	CT.ContinentName <> 'EUROPE'

GROUP BY
	CT.ContinentName,
	CY.CountryName

HAVING 
	COUNT(*) >= 5

ORDER BY
	CY.CountryName;