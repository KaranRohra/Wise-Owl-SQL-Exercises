USE WorldEvents;

GO
SELECT EventName, LEN(EventName) AS [Length of name] FROM tblEvent ORDER BY [Length of name];
