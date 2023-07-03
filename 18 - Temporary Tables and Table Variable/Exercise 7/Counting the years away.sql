USE WorldEvents;
GO

DECLARE @EventfullCountryByYear TABLE (
    [Year of events] INT,
    [Country of events] VARCHAR(100),
    [Number of events] INT
)


DECLARE @EarliestYear INT = (
    SELECT MIN(YEAR(EventDate)) FROM tblEvent
)

DECLARE @LatestYear INT = (
    SELECT MAX(YEAR(EventDate)) FROM tblEvent
)

WHILE @EarliestYear <= @LatestYear
BEGIN
    INSERT INTO @EventfullCountryByYear
    SELECT TOP 1
        @EarliestYear,
        cy.CountryName,
        COUNT(*) [Number of events]
    FROM
        tblEvent AS ev
        INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID
    WHERE
        YEAR(ev.EventDate) = @EarliestYear
    GROUP BY
        cy.CountryName
    ORDER BY
        [Number of events] DESC;
    
    
    SET @EarliestYear += 1;
END


SELECT * FROM @EventfullCountryByYear;