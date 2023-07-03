USE WorldEvents;
GO

WITH ThisAndThatEvents AS (
    SELECT
        EventID,
        CHARINDEX('This', EventDetails, 1) AS ThisPosition,
        CHARINDEX('That', EventDetails, 1) AS ThatPoistion

    FROM
        tblEvent
)
SELECT
    e.EventName,
    e.EventDate
FROM 
    ThisAndThatEvents AS tt
    INNER JOIN tblEvent AS e ON e.EventID = tt.EventID
WHERE
    tt.ThatPoistion > 0 AND
    tt.ThisPosition > 0 AND
    tt.ThisPosition < tt.ThatPoistion