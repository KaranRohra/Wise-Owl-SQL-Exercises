USE WorldEvents;


GO
SELECT
	EventName,
	EventDate,
	DATENAME(WEEKDAY, EventDate) AS [Day of week],
	DATENAME(DAY, EventDate) AS [Day number 1],
	DATEPART(DAY, EventDate) AS [Day number 2],
	DAY(EventDate) AS [Day number 3]
FROM tblEvent
WHERE
	DATENAME(WEEKDAY, EventDate) = 'Saturday' AND
	DAY(EventDate) = 14;