USE DoctorWho;
GO

DECLARE @BestEpisodes TABLE (
    [EpisodeId] INT,
    [Title] VARCHAR(100) ,
    [Why] VARCHAR(100)
)

INSERT INTO @BestEpisodes
    SELECT 
        ep.EpisodeId,
        ep.Title,
        au.AuthorName
    FROM 
        tblEpisode AS ep
        INNER JOIN tblAuthor AS au ON au.AuthorId = ep.AuthorId

    WHERE
        au.AuthorName = 'Steven Moffat'
UNION (
     SELECT 
        ep.EpisodeId,
        ep.Title,
        cp.CompanionName
    FROM 
        tblEpisode AS ep
        INNER JOIN tblEpisodeCompanion AS ec ON ec.EpisodeId = ep.EpisodeId
        INNER JOIN tblCompanion AS cp ON cp.CompanionId = ec.CompanionId

    WHERE
        cp.CompanionName = 'Amy Pond'
)


SELECT 
    Title,
    COUNT(*) AS [Number of mentions]

FROM 
    @BestEpisodes

GROUP BY
    Title

HAVING
    COUNT(*) >= 2

ORDER BY
    Title
