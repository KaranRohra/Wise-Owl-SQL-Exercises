USE WorldEvents;
GO

ALTER FUNCTION fnClassifyEvent(
    @EventName VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    RETURN (
        CASE
            WHEN @EventName IN (
                    SELECT TOP 1 EventName FROM tblEvent ORDER BY EventDate ASC
                ) THEN 'Oldest'
            WHEN @EventName IN (
                    SELECT TOP 1 EventName FROM tblEvent ORDER BY EventDate DESC
                ) THEN 'Newest'
            WHEN @EventName IN (
                    SELECT TOP 1 EventName FROM tblEvent ORDER BY EventName ASC
                ) THEN 'First alphabetically'
            WHEN @EventName IN (
                    SELECT TOP 1 EventName FROM tblEvent ORDER BY EventName DESC
                ) THEN 'Last alphabetically'
            ELSE 'Not a winner'
        END
    )
END
GO


SELECT
    EventName,
    dbo.fnClassifyEvent(EventName) AS Winners

FROM
    tblEvent

ORDER BY
    Winners
GO