USE Movies_02;

GO
SELECT title, s.Source 
FROM 
	Film AS f 
	JOIN [Source] AS s ON f.SourceID = s.SourceID
WHERE s.Source = 'NA'
ORDER BY f.Title;
