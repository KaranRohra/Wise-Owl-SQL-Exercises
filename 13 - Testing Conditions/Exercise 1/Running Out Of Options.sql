USE WorldEvents;
GO

ALTER PROC uspInformation(
	@info VARCHAR(50)
)
AS
BEGIN
	IF @info = 'Event' 
		BEGIN
			SELECT EventName, EventDetails, EventDate FROM tblEvent;
		END
	ELSE IF @info = 'Country'
		BEGIN
			SELECT CountryName FROM tblCountry;
		END
	ELSE IF @info = 'Continent'
		BEGIN
			SELECT ContinentName FROM tblContinent;
		END
	ELSE
		BEGIN
			SELECT 'You must enter: Event, Country or Continent' AS 'Nuh uh say the magic word'
		END

END;
Go

EXEC uspInformation 'Event';
EXEC uspInformation 'Country';
EXEC uspInformation 'Continent';
EXEC uspInformation 'Karan';

