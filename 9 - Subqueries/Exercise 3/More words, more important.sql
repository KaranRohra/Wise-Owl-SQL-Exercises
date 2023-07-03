USE WorldEvents;

GO
SELECT
	EventName

FROM 
	tblEvent

WHERE
	LEN(EventName) > (SELECT SUM(LEN(EventName)) / COUNT(*) FROM tblEvent);