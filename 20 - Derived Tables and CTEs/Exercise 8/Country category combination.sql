USE WorldEvents;
GO

WITH MostEventCountry AS (
    SELECT TOP 3
        cy.CountryID,
        cy.CountryName
    
    FROM
        tblCountry AS cy
        INNER JOIN tblEvent AS e ON cy.CountryID = e.CountryID
    
    GROUP BY
        cy.CountryName,
        cy.CountryID
    
    ORDER BY
        COUNT(*) DESC

), MostEventCategory AS (
    SELECT TOP 3
        ca.CategoryID,
        ca.CategoryName
    
    FROM
        tblCategory AS ca
        INNER JOIN tblEvent AS e ON ca.CategoryID = e.CategoryID
    
    GROUP BY
        ca.CategoryName,
        ca.CategoryID
    
    ORDER BY
        COUNT(*) DESC
)

SELECT
    cy.CountryName,
    cg.CategoryName,
    (
        SELECT COUNT(*) FROM tblEvent 
        WHERE CategoryID = cg.CategoryID AND CountryID = cy.CountryID
    ) AS [NumberEvents]
FROM
    MostEventCountry AS cy
    CROSS JOIN MostEventCategory AS cg
