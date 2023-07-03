USE WorldEvents;
GO

WITH EventsByEra AS (
    SELECT
        CASE
            WHEN YEAR(e.EventDate) < 1900 THEN '19th Century and earlier'
            WHEN YEAR(e.EventDate) < 2000 THEN '20th Century'
            ELSE '21st Century'
        END AS Era,
        EventId
    
    FROM
        tblEvent AS e
)

SELECT
    Era,
    COUNT(*) AS [Number of events]

FROM
    EventsByEra

GROUP BY
    Era