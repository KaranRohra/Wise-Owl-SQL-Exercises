USE WorldEvents;


GO
CREATE PROC ItWasAGoodYear
	@FirstDay datetime,
	@LastDay datetime
AS
SELECT
	*

FROM
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID

WHERE
	EV.EventDate BETWEEN @FirstDay AND @LastDay;



GO
EXEC ItWasAGoodYear @FirstDay = '2001-01-01', @LastDay = '2002-12-31';