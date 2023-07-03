USE WorldEvents;
GO


SELECT
    EventName,
    CountryName

FROM (
    SELECT e.EventName, e.CountryId FROM tblEvent AS e WHERE RIGHT(EventName, 1) BETWEEN 'N' AND 'Z'
) AS Second_half_Derived
INNER JOIN tblCountry AS cy ON cy.CountryID = Second_half_Derived.CountryID
GO
