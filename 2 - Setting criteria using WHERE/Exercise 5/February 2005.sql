USE WorldEvents;

GO
SELECT EventName AS What, EventDetails AS [When] FROM tblEvent
WHERE YEAR(EventDate) = 2005 AND MONTH(EventDate) = 2;


GO
SELECT EventName AS What, EventDetails AS [When] FROM tblEvent
WHERE EventDate BETWEEN '2005-02-01' AND '2005-02-28';

