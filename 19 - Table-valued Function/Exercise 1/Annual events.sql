USE WorldEvents;
GO

ALTER FUNCTION fnEventsForYear(
    @Year INT
)
RETURNS TABLE
AS
    RETURN 
        SELECT 
            ev.EventName, 
            ev.EventDetails, 
            ca.CategoryName,
            cy.CountryName
        FROM 
            tblEvent AS ev
            INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID
            INNER JOIN tblCategory AS ca ON ca.CategoryID = ev.CategoryID
        WHERE YEAR(EventDate) = @Year
GO

SELECT * FROM fnEventsForYear(1918);