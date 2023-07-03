USE DoctorWho;

GO
ALTER PROC spEnemyEpisodes
	@feature varchar(50)
AS
SELECT
	EP.SeriesNumber,
	EP.EpisodeId,
	EP.Title

FROM
	tblEpisodeEnemy AS EE
	INNER JOIN tblEnemy AS EN ON EN.EnemyId = EE.EnemyId
	INNER JOIN tblEpisode AS EP ON EP.EpisodeId = EE.EpisodeId

WHERE
	EN.EnemyName LIKE '%' + @feature + '%'

ORDER BY
	EP.SeriesNumber,
	EP.EpisodeId;

GO
EXEC spEnemyEpisodes 'silence';