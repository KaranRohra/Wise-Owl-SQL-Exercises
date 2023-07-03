USE WorldEvents;
GO

ALTER PROC spFirstEventContinent(
	@ContinentName varchar(100) Output
)
AS
DECLARE @FirstEventDate DATETIME = (SELECT MIN(EventDate) FROM tblEvent);
SELECT
	@ContinentName = CT.ContinentName

FROM
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID
	INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID

WHERE 
	EV.EventDate = @FirstEventDate;
GO


ALTER PROC spEvents(
	@ContinentName varchar(100)
)
AS
SELECT
	EV.EventName,
	EV.EventDate,
	CT.ContinentName

FROM
	tblEvent AS EV
	INNER JOIN tblCountry AS CY ON CY.CountryID = EV.CountryID
	INNER JOIN tblContinent AS CT ON CT.ContinentID = CY.ContinentID

WHERE 
	CT.ContinentName = @ContinentName;
GO


DECLARE @FirstContinentName varchar(100) = ''
EXEC spFirstEventContinent @ContinentName = @FirstContinentName OUTPUT;

EXEC spEvents @ContinentName = @FirstContinentName;

