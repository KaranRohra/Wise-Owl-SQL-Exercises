USE WorldEvents;
GO


ALTER FUNCTION fnContinentSummary(
    @ContinentName VARCHAR(100),
    @MonthName VARCHAR(100)
) RETURNS @summary TABLE (
    ContinentName VARCHAR(100),
    [Number of events] INT,
    [Number of countries] INT,
    [Number of categories] INT
) AS
BEGIN
    INSERT INTO @summary
    SELECT
        ContinentName,
        COUNT(EventID),
        COUNT(DISTINCT cy.CountryName),
        COUNT(DISTINCT ca.CategoryName)
    
    FROM
        tblEvent AS ev
        INNER JOIN tblCountry AS cy ON cy.CountryID = ev.CountryID
        INNER JOIN tblCategory AS ca ON ca.CategoryID = ev.CategoryID
        INNER JOIN tblContinent AS ct ON ct.ContinentID = cy.ContinentID
    
    WHERE
        MONTH(ev.EventDate) = DATEPART(MM, '2023-' + @MonthName +'-03')
        -- FORMAT(ev.EventDate, 'MMMM') = @MonthName
    GROUP BY
        ContinentName
    
    HAVING
        ContinentName = @ContinentName

    RETURN
END
GO

SELECT * FROM fnContinentSummary('Europe', 'April');