USE WorldEvents;


GO
SELECT
	EventName,
	EventDate AS NotFormatted,
	FORMAT(EventDate, 'dd/MM/yyyy') AS UsingFormat,
	CONVERT(VARCHAR(10), EventDate, 103) AS UsingConvert
FROM tblEvent 
WHERE YEAR(EventDate) = 1978
ORDER BY EventDate;