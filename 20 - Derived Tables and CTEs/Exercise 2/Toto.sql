USE WorldEvents;
GO

WITH ManyCountries AS (
    SELECT
        ct.ContinentName,
        COUNT(*) AS [Country Count]
    
    FROM
        tblCountry AS cy
        INNER JOIN tblContinent AS ct ON ct.ContinentID = cy.ContinentID
    
    GROUP BY
        ct.ContinentName
    
    HAVING
        COUNT(*) >= 3
), 
FewEvents AS (
    SELECT
        ct.ContinentName,
        COUNT(*) AS [Event Count]
    
    FROM
        tblEvent AS e
        INNER JOIN tblCountry AS cy ON cy.CountryID = e.CountryID
        INNER JOIN tblContinent AS ct ON ct.ContinentID = cy.ContinentID
    
    GROUP BY
        ct.ContinentName
    
    HAVING
        COUNT(*) <= 10

)

SELECT
    mc.ContinentName,
    mc.[Country Count],
    fe.[Event Count]

FROM
    ManyCountries AS mc
    INNER JOIN FewEvents AS fe ON mc.ContinentName = fe.ContinentName;