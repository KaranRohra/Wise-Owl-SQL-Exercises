USE DoctorWho;
GO

WITH Episodes_RT_NOT_DT AS (
    SELECT
        e.EpisodeId

    FROM
        tblEpisode AS e
        INNER JOIN tblEpisodeCompanion AS ec ON ec.EpisodeId = e.EpisodeId
        INNER JOIN tblCompanion AS cp ON cp.CompanionId = ec.CompanionId
        INNER JOIN tblDoctor AS dr ON dr.DoctorId = e.DoctorId

    WHERE
        cp.CompanionName LIKE '%Rose Tyler%' AND
        dr.DoctorName NOT LIKE '%David Tennant%'

)
SELECT
    DISTINCT en.EnemyName

FROM
    Episodes_RT_NOT_DT AS e
    INNER JOIN tblEpisodeEnemy AS ee ON ee.EpisodeId = e.EpisodeId
    INNER JOIN tblEnemy AS en ON en.EnemyId = ee.EnemyId