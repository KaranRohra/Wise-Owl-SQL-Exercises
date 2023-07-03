USE WorldEvents;
GO

DECLARE @MostEvents TABLE (
    Source VARCHAR(100),
    Winner VARCHAR(100),
    [Number of events] INT
)

INSERT INTO @MostEvents 
    SELECT TOP 1
        'Category',
        ca.CategoryName,
        COUNT(*)

    FROM
        tblEvent AS ev
        INNER JOIN tblCategory AS ca ON ca.CategoryID = ev.CategoryID

    GROUP BY
        ca.CategoryName

    ORDER BY 
        COUNT(*) DESC
    

INSERT INTO @MostEvents 
    SELECT TOP 1
        'Country',
        cy.CountryName,
        COUNT(*)

    FROM
        tblEvent AS ev
        INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID

    GROUP BY
        cy.CountryName

    ORDER BY 
        COUNT(*) DESC


INSERT INTO @MostEvents 
    SELECT TOP 1
        'Continent',
        ct.ContinentName,
        COUNT(*)

    FROM
        tblEvent AS ev
        INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID
        INNER JOIN tblContinent AS ct ON ct.ContinentID = cy.ContinentID

    GROUP BY
        ct.ContinentName

    ORDER BY 
        COUNT(*) DESC


SELECT * FROM @MostEvents;