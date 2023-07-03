USE WorldEvents;
GO

SET NOCOUNT ON;

SELECT TOP 2 EventName AS What, EventDetails AS [When] FROM tblEvent ORDER BY EventDate ASC;

SELECT TOP 2 EventName AS What, EventDetails AS [When] FROM tblEvent ORDER BY EventDate DESC;