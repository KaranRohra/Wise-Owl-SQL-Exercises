USE WorldEvents;


GO
SELECT
	EventName,
	FORMAT(EventDate, 'dd MMM yyyy') AS EventDate,
	DATEDIFF(DAY, EventDate, '1964-03-04') AS [Days offset],
	ABS(DATEDIFF(DAY, EventDate, '1964-03-04')) AS [Days difference]
FROM tblEvent ORDER BY [Days difference];

