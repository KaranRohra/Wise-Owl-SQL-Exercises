USE DoctorWho;
GO

DECLARE @EpisodeTypeStart VARCHAR(100) = '';

SELECT
    @EpisodeTypeStart += CONCAT(
            CASE
                WHEN LEN(@EpisodeTypeStart) <> 0 THEN ','
                ELSE ''
            END,
            '[' + LEFT(EpisodeType, CHARINDEX(' ', EpisodeType + ' ', 1) - 1) + ']'
       )

FROM
    tblEpisode

GROUP BY
    EpisodeType;

PRINT @EpisodeTypeStart;


DECLARE @sql varchar(max) = 'WITH Episodes AS (
    SELECT
        LEFT(e.EpisodeType, CHARINDEX('' '', e.EpisodeType + 
        '' '', 1)) AS EpisodeType,
        dr.DoctorName,
        e.EpisodeId
    FROM
        tblEpisode AS e
        INNER JOIN tblDoctor AS dr ON dr.DoctorId = e.DoctorId
)
SELECT
   *
FROM
    Episodes AS e
PIVOT (
    COUNT(e.EpisodeId)
    FOR EpisodeType IN (' + @EpisodeTypeStart + ')
) AS PivotTable'

EXEC(@sql)