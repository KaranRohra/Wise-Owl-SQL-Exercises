USE DoctorWho;
GO

WITH DavidEpisodes AS (
    SELECT
        e.EpisodeId,
        e.Title,
        (
            SELECT COUNT(*)
            FROM tblEpisode AS ie
            INNER JOIN tblEpisodeEnemy AS iee ON iee.EpisodeId = ie.EpisodeId
            INNER JOIN tblDoctor AS idr ON idr.DoctorId = ie.DoctorId
            WHERE
                iee.EnemyId = ee.EnemyId AND
                dr.DoctorName NOT LIKE '%David Tennant%'
        ) AS Non_David_Cnt
    
    FROM
        tblEpisode AS e
        INNER JOIN tblEpisodeEnemy AS ee ON e.EpisodeId = ee.EpisodeId
        INNER JOIN tblDoctor AS dr ON dr.DoctorId = e.DoctorId
    
    WHERE
        dr.DoctorName LIKE '%David Tennant%'
)
SELECT
    EpisodeId,
    Title
FROM
    DavidEpisodes
GROUP BY
    EpisodeId,
    Title
HAVING
    SUM(Non_David_Cnt) = 0


-- WITH Non_David_CTE AS (
--     SELECT
--         e.EpisodeId,
--         e.Title,
--         ee.EnemyId

--     FROM
--         tblEpisode AS e
--         INNER JOIN  tblDoctor AS dr ON dr.DoctorId = e.DoctorId
--         INNER JOIN tblEpisodeEnemy AS ee ON ee.EpisodeId = e.EpisodeId

--     WHERE
--         dr.DoctorName NOT LIKE '%David Tennant%'
-- ), David_CTE AS (
--     SELECT
--         e.EpisodeId,
--         e.Title,
--         ee.EnemyId

--     FROM
--         tblEpisode AS e
--         INNER JOIN  tblDoctor AS dr ON dr.DoctorId = e.DoctorId
--         INNER JOIN tblEpisodeEnemy AS ee ON ee.EpisodeId = e.EpisodeId

--     WHERE
--         dr.DoctorName LIKE '%David Tennant%'
-- )
-- SELECT
--     DISTINCT
--     d.EpisodeId,
--     d.Title

-- FROM
--     Non_David_CTE AS nd
--     FULL JOIN David_CTE AS d ON nd.EnemyId = d.EnemyId

-- WHERE
--     nd.EnemyId IS NULL

-- ORDER BY
--     d.Title;
