USE WorldEvents;


SELECT 
	EventName, 
	EventDate, 
	CHARINDEX('this', EventDetails, 1) AS thisPosition,
	CHARINDEX('that', EventDetails, 1) AS thatPosition,
	CHARINDEX('that', EventDetails, 1) - CHARINDEX('this', EventDetails, 1) AS Offset
FROM tblEvent
WHERE 
	CHARINDEX('this', EventDetails, 1) > 0 AND 
	CHARINDEX('this', EventDetails, 1) > 0 AND 
	CHARINDEX('that', EventDetails, 1) - CHARINDEX('this', EventDetails, 1) > 0
ORDER BY EventDate;

