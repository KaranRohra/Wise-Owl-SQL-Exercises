USE DoctorWho;

GO
ALTER VIEW vwSeriesOne
AS
SELECT
	Title, 
	SeriesNumber,
	EpisodeNumber,
	EpisodeDate

FROM 
	tblEpisode

WHERE 
	SeriesNumber = 2;



GO
SELECT * FROM vwSeriesOne;