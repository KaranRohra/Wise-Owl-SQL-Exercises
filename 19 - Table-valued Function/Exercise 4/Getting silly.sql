USE DoctorWho;
GO

CREATE FUNCTION fnSilly(
    @CompanionName VARCHAR(100),
    @EnemyName VARCHAR(100)
) RETURNS @episodes TABLE (
    SeriesNumber INT,
    EpisodeNumber INT,
    Title VARCHAR(100),
    Doctor VARCHAR(100),
    Author VARCHAR(100),
    Appearing VARCHAR(max)
) AS
BEGIN
    INSERT INTO @episodes (
        SeriesNumber,
        EpisodeNumber,
        Title,
        Doctor,
        Author,
        Appearing
    ) (
        SELECT
            ep.SeriesNumber,
            ep.EpisodeNumber,
            ep.Title,
            dr.DoctorName,
            au.AuthorName,
            dbo.fnCompanions(ep.EpisodeId)
        FROM
            tblEpisode AS ep
            INNER JOIN tblDoctor AS dr ON dr.DoctorId = ep.DoctorId
            INNER JOIN tblAuthor AS au ON au.AuthorId = ep.AuthorId
            INNER JOIN tblEpisodeCompanion AS ec ON ec.EpisodeId = ep.EpisodeId
            INNER JOIN tblCompanion AS cp ON cp.CompanionId = ec.CompanionId
        WHERE
            cp.CompanionName LIKE '%'+ @CompanionName +'%'
    ) UNION (
        SELECT
            ep.SeriesNumber,
            ep.EpisodeNumber,
            ep.Title,
            dr.DoctorName,
            au.AuthorName,
            dbo.fnEnemies(ep.EpisodeId)
        FROM
            tblEpisode AS ep
            INNER JOIN tblDoctor AS dr ON dr.DoctorId = ep.DoctorId
            INNER JOIN tblAuthor AS au ON au.AuthorId = ep.AuthorId
            INNER JOIN tblEpisodeEnemy AS ee ON ee.EpisodeId = ee.EpisodeId
            INNER JOIN tblEnemy AS en ON en.EnemyId = ee.EnemyId
        WHERE
            en.EnemyName LIKE '%'+ @EnemyName +'%'
    )
        
    RETURN
END
GO

SELECT * FROM dbo.fnSilly('wilf', 'ood')

-- Still bored?  You could always work out how to 
-- combine the companions and enemies in the Appearing column for a 
-- duplicated episode, to avoid it appearing twice in the list 
