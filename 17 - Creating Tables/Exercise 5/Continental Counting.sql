USE WorldEvents;
GO


IF EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_NAME = 'Continent_Summary'
)
    DROP TABLE Continent_Summary;
GO


CREATE TABLE Continent_Summary (
    ContinentName VARCHAR(100) PRIMARY KEY,
    [Countries in Continent] INT NOT NULL,
    [Events in Continent] INT NOT NULL,
    [Earliest Continent event] DATE NOT NULL,
    [Latest Continent event] DATE NOT NULL
)
GO


INSERT INTO Continent_Summary
SELECT
    ct.ContinentName,
    COUNT(DISTINCT cy.CountryName),
    COUNT(ev.EventID),
    MIN(ev.EventDate),
    MAX(ev.EventDate)

FROM
    tblEvent AS ev
    INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID
    INNER join tblContinent AS ct ON ct.ContinentID = cy.ContinentID

GROUP BY
    ct.ContinentName,
    ct.ContinentID;
GO


SELECT * FROM Continent_Summary;