USE WorldEvents;
GO

WITH First_Half_CTE AS (
    SELECT * FROM tblEvent
    WHERE 
        LEFT(EventName, 1) BETWEEN 'A' AND 'M'
)
SELECT
    cg.CategoryName,
    fh.EventName
FROM
    First_Half_CTE AS fh
    INNER JOIN tblCategory AS cg ON cg.CategoryID = fh.CategoryID