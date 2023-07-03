USE WorldEvents;
GO

WITH ThisAndThat
AS (
   SELECT
        EventID,
        CASE
            WHEN EventDetails LIKE'%This%' AND EventDetails LIKE '%That%' THEN 'This and That'
            WHEN EventDetails LIKE'%This%' THEN 'This'
            WHEN EventDetails LIKE'%That%' THEN 'That'
            ELSE 'None'
        END AS ThisThat
    FROM
        tblEvent
)

-- SELECT
--     CASE
--         WHEN ThisThat LIKE '%This%' THEN 1
--         ELSE 0
--     END AS [If This],
--     CASE
--         WHEN ThisThat LIKE '%That%' THEN 1
--         ELSE 0
--     END AS [If That],
--     COUNT(*) AS [Number of events]
-- FROM
--     ThisAndThat
-- GROUP BY
--     ThisThat
-- ORDER BY
--     [Number of events] DESC;

SELECT
    e.EventName,
    e.EventDetails
FROM
    ThisAndThat AS tt
    INNER JOIN tblEvent AS e ON e.EventID = tt.EventID
WHERE
    tt.ThisThat = 'This and That'
