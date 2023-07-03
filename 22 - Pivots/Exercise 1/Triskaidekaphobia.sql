USE DoctorWho;
GO

WITH EpisodesByYear AS (
    SELECT 
        YEAR(EpisodeDate) AS EpisodeYear,
        SeriesNumber,
        EpisodeId

    FROM
        tblEpisode
)
SELECT
    EpisodeYear,
    [1], [2], [3], [4], [5], [6]

FROM EpisodesByYear AS ey
PIVOT (
    COUNT(ey.EpisodeId)
    FOR ey.SeriesNumber in ([1], [2], [3], [4], [5], [6])
) AS PivotTable