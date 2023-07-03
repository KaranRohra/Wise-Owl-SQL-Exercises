USE WorldEvents;


GO
SELECT
	EventName,
	CASE
		WHEN DAY(EventDate) IN (1, 21, 31) THEN FORMAT(EventDate, 'dddd dd"\st" MMMM yyyy') 
		WHEN DAY(EventDate) IN (2, 22) THEN FORMAT(EventDate, 'dddd dd"\nd" MMMM yyyy')
		WHEN DAY(EventDate) IN (3, 23) THEN FORMAT(EventDate, 'dddd dd"\rd" MMMM yyyy')
		ELSE FORMAT(EventDate, 'dddd dd"\th" MMMM yyyy') 
	END AS [Full date]
FROM tblEvent
ORDER BY EventDate;


GO
SELECT
	EventName,
	DATENAME(WEEKDAY, EventDate) + ' ' +
	DATENAME(DAY, EventDate) +
	CASE
		WHEN DAY(EventDate) IN (1, 21, 31) THEN 'st'
		WHEN DAY(EventDate) IN (2, 22) THEN 'nd'
		WHEN DAY(EventDate) IN (3, 23) THEN 'rd'
		ELSE 'th'
	END + ' ' +
	DATENAME(MONTH, EventDate) + ' ' +
	DATENAME(YEAR, EventDate)
	AS [Full date]
FROM tblEvent
ORDER BY EventDate;


