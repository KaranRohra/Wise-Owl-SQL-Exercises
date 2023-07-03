USE WorldEvents;
GO

DECLARE @EventsWithFirstLetter TABLE (
    [First letter]  VARCHAR(1),
    [Number of events] int
)

-- INSERT INTO @EventsWithFirstLetter VALUES ('xy', 1);

INSERT INTO @EventsWithFirstLetter
SELECT
    LEFT(EventName, 1),
    COUNT(*)

FROM
    tblEvent

GROUP BY
    LEFT(EventName, 1)


SELECT * FROM @EventsWithFirstLetter ORDER BY [First letter]