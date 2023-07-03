USE DoctorWho;

GO
ALTER PROC spListEpisodes
	@series_num int = NULL
AS
BEGIN
	SELECT *
	FROM
		tblEpisode
	WHERE 
		SeriesNumber = @series_num OR
		@series_num IS NULL;

END

GO
EXEC spListEpisodes @series_num = 2;
EXEC spListEpisodes;




