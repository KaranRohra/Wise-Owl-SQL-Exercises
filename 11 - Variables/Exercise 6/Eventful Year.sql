USE WorldEvents;

GO
DECLARE @EventsInYear varchar(100) = '';

SELECT TOP 3
	@EventsInYear = @EventsInYear + 
	CASE
		WHEN LEN(@EventsInYear) <> 0 THEN ', '
		ELSE ''
	END + EventName

FROM
	tblEvent

WHERE
	YEAR(EventDate) = 1992

ORDER BY
	EventName;


SELECT 
	@EventsInYear AS [Eventful year];