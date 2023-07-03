USE WorldEvents;


GO
SELECT C.CategoryName
FROM tblCategory AS C LEFT JOIN tblEvent AS E
ON C.CategoryID = E.CategoryID
WHERE E.EventID IS NULL;



