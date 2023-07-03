USE DoctorWho;
GO

ALTER PROC spSelect (
    @Columns VARCHAR(max),
    @TableName VARCHAR(max),
    @NumberRows INT,
    @OrderColumn VARCHAR(max),
    @OrderBy VARCHAR(max)
) AS
BEGIN
    DECLARE @sql VARCHAR(max) = CONCAT(
        'SELECT TOP ', @NumberRows, ' ', @Columns,
        ' FROM ', @TableName,
        ' ORDER BY ', @OrderColumn, ' ', @OrderBy
    );

    EXEC(@sql);
END
GO

EXEC spSelect @Columns = 'EpisodeId, Title, EpisodeDate',
    @TableName = 'tblEpisode', 
    @OrderColumn = 'Title', 
    @OrderBy = 'ASC',
    @NumberRows = 10;
