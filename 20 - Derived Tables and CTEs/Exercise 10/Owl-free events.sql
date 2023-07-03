USE WorldEvents;
GO

WITH NotOwl AS (
    SELECT *
    FROM tblEvent
    WHERE 
        EventDetails NOT LIKE '%O%' AND
        EventDetails NOT LIKE '%W%' AND
        EventDetails NOT LIKE '%L%'
), OwlCountry AS (
    SELECT *
    FROM tblEvent
    WHERE CountryID IN (SELECT CountryID FROM NotOwl)
), OwlCategory AS (
    SELECT *
    FROM tblEvent
    WHERE CategoryID IN (SELECT CategoryID FROM OwlCountry)
)
SELECT * FROM OwlCategory ORDER BY EventDate;