USE WorldEvents;

GO
SELECT T3.EventName, T3.EventDate, T2.CountryName, T1.ContinentName 
FROM (
	tblContinent AS T1 
	INNER JOIN 
	tblCountry AS T2 
	ON T1.ContinentID = T2.ContinentID
) INNER JOIN 
	tblEvent AS T3 
	ON T3.CountryID = T2.CountryID
WHERE T2.CountryName = 'RUSSIA' OR T1.ContinentName = 'ANTARCTIC';

