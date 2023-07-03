USE WorldEvents;

GO
SELECT EventName, 
	CASE
	WHEN LEFT(EventName, 1) IN ('A','E','I','O','U') AND
		LEFT(EventName, 1) = RIGHT(EventName, 1) THEN 'Same Vowel'

	WHEN LEFT(EventName, 1) IN ('A','E','I','O','U') AND 
		RIGHT(EventName, 1) IN ('A','E','I','O','U') 
		THEN 'Begins and ends with vowel'

	WHEN LEFT(EventName, 1) = RIGHT(EventName, 1) THEN 'Same letter'
	END 'Verdict'
FROM tblEvent
WHERE (
		LEFT(EventName, 1) IN ('A','E','I','O','U') AND RIGHT(EventName, 1) IN ('A','E','I','O','U')
	) OR LEFT(EventName, 1) = RIGHT(EventName, 1)
ORDER BY EventDate;