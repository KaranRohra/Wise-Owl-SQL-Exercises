USE WorldEvents;

GO
DECLARE @Title varchar(100) = 'Summary of events';
DECLARE @EarliestDate date;
DECLARE @LatestDate date;
DECLARE @NumberOfEvents int;

SELECT
	@EarliestDate = MIN(EventDate),
	@LatestDate = MAX(EventDate),
	@NumberOfEvents = COUNT(*)

FROM 
	tblEvent;


SELECT
	@Title AS [Title],
	CONVERT(varchar(10),  @EarliestDate, 103) As [Earliest Date],
	CONVERT(varchar(10), @LatestDate, 103) AS [Latest Date],
	@NumberOfEvents AS [Number of Events];

