USE WorldEvents;

GO
SELECT ContinentName, Summary,
	ISNULL(Summary, 'No Summary') AS [Using ISNULL],
	COALESCE(Summary, 'No Summary') AS [Using COALESCE],
	CASE 
		WHEN summary IS NULL THEN 'No Summary'
		ELSE Summary
	END AS [Using Case]
FROM tblContinent;