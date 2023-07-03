USE WorldEvents;


GO
SELECT C.CountryName
FROM tblCountry AS C LEFT JOIN tblEvent AS E
ON C.CountryID = E.CountryID
WHERE E.EventID IS NULL;



