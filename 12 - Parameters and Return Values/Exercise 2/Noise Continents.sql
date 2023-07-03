USE WorldEvents;

GO
DECLARE @OutputParameter VARCHAR(100) = '';

SELECT
	@OutputParameter = @OutputParameter + CT.ContinentName + ', '

FROM
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID
	INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID

GROUP BY
	CT.ContinentName

HAVING
	COUNT(*) >= 50;


SELECT LEFT(@OutputParameter, LEN(@OutputParameter) - 1) AS 'Big happenings';