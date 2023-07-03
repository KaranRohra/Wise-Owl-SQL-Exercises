USE WorldEvents;
GO

ALTER PROC uspContinentEvents(
	@ContinentName VARCHAR(100) = '',
	@After VARCHAR(100) = '1700-01-01',
	@Before DATETIME = '2300-01-01'
)
AS
BEGIN
	SELECT
		CT.ContinentName,
		EV.EventName,
		EV.EventDate

	FROM
		tblEvent AS EV
		INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID
		INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID

	WHERE
		CT.ContinentName LIKE '%' + @ContinentName + '%' AND
		EV.EventDate >= @After AND
		EV.EventDate <= @Before
END;
GO

EXEC uspContinentEvents @ContinentName = 'Asia', @After = '1990-01-01', @Before = '2001-01-01';
EXEC uspContinentEvents;




