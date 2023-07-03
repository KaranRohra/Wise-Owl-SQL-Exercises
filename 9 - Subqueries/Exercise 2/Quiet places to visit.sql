USE WorldEvents;
GO

SELECT
	CT.ContinentName,
	EV.EventName

FROM
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID
	INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID

WHERE
	CT.ContinentName IN (
		SELECT TOP 3
			CT.ContinentName

		FROM
			tblEvent AS EV
			INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID
			INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID

		GROUP BY
			CT.ContinentID,
			CT.ContinentName

		ORDER BY
			COUNT(*)
	)







