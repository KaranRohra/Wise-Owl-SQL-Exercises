USE DoctorWho;

GO
DECLARE @EpisodeId int = 15;
DECLARE @EnemnyList VARCHAR(100) = '';

SELECT 
	@EnemnyList = @EnemnyList +
	CASE
		WHEN LEN(@EnemnyList) > 0 THEN ', '
		ELSE ''
	END + EN.EnemyName

FROM 
	tblEnemy AS EN
	INNER JOIN tblEpisodeEnemy AS EE ON EE.EnemyId = EN.EnemyId

WHERE
	EE.EpisodeId = @EpisodeId;


SELECT
	@EpisodeId AS [Episode id],
	@EnemnyList AS Enemies;