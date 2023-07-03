USE WorldEvents;
GO

CREATE TABLE Summary_Data(
    SummaryItem VARCHAR(100) UNIQUE,
    CountEvent INT
);

INSERT INTO Summary_Data (SummaryItem, CountEvent)(
    SELECT 
        cy.CountryName,
        COUNT(*)
    FROM
        tblEvent AS ev
        INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID
    GROUP BY
        cy.CountryName
) UNION (
    SELECT 
        ct.ContinentName,
        COUNT(*)
    FROM
        tblEvent AS ev
        INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID
        INNER JOIN tblContinent AS ct ON ct.ContinentID = cy.ContinentID
    GROUP BY
        ct.ContinentName
) UNION (
    SELECT
        'Last Millenium',
        COUNT(*)
    FROM
        tblEvent
    WHERE
        EventDate < '2000-01-01'
) UNION (
    SELECT
        'This Millenium',
        COUNT(*)
    FROM
        tblEvent
    WHERE
        EventDate >= '2000-01-01'
);
GO

SELECT * FROM Summary_Data ORDER BY CountEvent DESC;

