USE WorldEvents;
GO

WITH SpaceCategory AS (
    SELECT 
        DISTINCT cy.CountryName AS CountryName,
        ca.CategoryName
    FROM 
        tblEvent AS e
        INNER JOIN tblCountry AS cy ON cy.CountryID = e.CountryID
        INNER JOIN tblCategory AS ca ON ca.CategoryID = e.CategoryID

    WHERE 
        CountryName = 'Space'

    -- GROUP BY
    --     ca.CategoryName
),
NonSpace AS (
    SELECT
        cy.CountryName,
        ca.CategoryName
    FROM 
        tblEvent AS e
        INNER JOIN tblCountry AS cy ON cy.CountryID = e.CountryID
        INNER JOIN tblCategory AS ca ON ca.CategoryID = e.CategoryID

    WHERE 
        CountryName <> 'Space'
)

SELECT
    DISTINCT ns.CountryName
FROM
    SpaceCategory AS sc
    INNER JOIN NonSpace AS ns ON sc.CategoryName = ns.CategoryName;