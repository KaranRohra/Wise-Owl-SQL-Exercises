USE WorldEvents;
GO

-- QUERY 1
SELECT * FROM tblEvent WHERE CategoryID != 14 AND EventDetails LIKE '%Train%';

-- QUERY 2
SELECT * FROM tblEvent WHERE CountryID = 13 AND EventDetails NOT LIKE '%Space%' AND EventName NOT LIKE '%Space%';

-- QUERY 3
SELECT * FROM tblEvent 
WHERE CategoryID in (5, 6) AND 
	EventDetails NOT LIKE '%War%' AND 
	EventDetails NOT LIKE '%Death%';
