USE DoctorWho;

GO
ALTER PROC spMattSmithEpisodes
AS
SELECT
	EP.SeriesNumber,
	EP.EpisodeId,
	EP.Title,
	EP.EpisodeDate,
	DR.DoctorName

FROM 
	tblEpisode AS EP
	INNER JOIN tblDoctor AS DR ON DR.DoctorId = EP.DoctorId

WHERE
	DR.DoctorName = 'Matt Smith' AND
	YEAR(EP.EpisodeDate) = 2012

ORDER BY
	EP.EpisodeDate;


GO
EXEC spMattSmithEpisodes;