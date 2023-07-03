USE DoctorWho;
GO

ALTER PROC spEpisodesSorted (
    @SortColumn VARCHAR(max) = 'EpisodeId',
    @SortOrder VARCHAR(max) = 'ASC'
) AS 
BEGIN
    DECLARE @sql1 VARCHAR(max) = 
        'SELECT * FROM tblEpisode ORDER BY ' + 
        @SortColumn + ' ' + 
        @SortOrder;
    
    EXEC(@sql1)
END
GO

EXEC spEpisodesSorted @SortColumn = 'Title'

