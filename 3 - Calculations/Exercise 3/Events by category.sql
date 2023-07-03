USE WorldEvents;

GO
SELECT CONCAT(EventName, ' (category ', CAST(CategoryID AS varchar(10)), ')') AS [Event (category)], EventDate FROM tblEvent
WHERE CountryID = 1;



