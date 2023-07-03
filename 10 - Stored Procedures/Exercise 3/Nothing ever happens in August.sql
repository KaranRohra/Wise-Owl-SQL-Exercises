USE WorldEvents;

GO
CREATE PROC uspAugustEvents
AS
SELECT
	*

FROM 
	tblEvent

WHERE
	MONTH(EventDate) = 8

ORDER BY
	EventDate;


GO
EXEC uspAugustEvents;