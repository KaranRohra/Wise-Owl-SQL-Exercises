USE DoctorWho;
GO

WITH AuthorsHaveMP AS (
    SELECT
        e.EpisodeId
    FROM 
        tblEpisode AS e
        INNER JOIN tblAuthor AS a ON e.AuthorId = a.AuthorId
    WHERE
        a.AuthorName LIKE '%MP%'
)

SELECT
    DiSTINCT c.CompanionName
FROM 
    AuthorsHaveMP AS a
    INNER JOIN tblEpisodeCompanion AS ec ON ec.EpisodeId = a.EpisodeId
    INNER JOIN tblCompanion AS c ON c.CompanionId = ec.CompanionId
ORDER BY
    c.CompanionName;
    