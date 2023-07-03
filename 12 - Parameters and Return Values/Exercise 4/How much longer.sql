USE WorldEvents;


GO
ALTER PROC spEventNameDiff
AS
BEGIN

DECLARE @Min_event_len int;
DECLARE @Max_event_len int;

SELECT
	@Min_event_len = MIN(LEN(EventName)),
	@Max_event_len = MAX(LEN(EventName))

FROM
	tblEvent;

RETURN @Max_event_len - @Min_event_len;

END;


GO
DECLARE @Diff int;
EXEC @Diff = spEventNameDiff;

SELECT 
	CONCAT('The difference between the longest film and the shortest is: ',
	@Diff, ' characters') AS 'How much longer?';