USE DoctorWho;


GO
SELECT
	EN.EnemyName,
	YEAR(EP.EpisodeDate) AS [Episode year],
	COUNT(*) AS [Number of episodes]

FROM
	tblEpisode AS EP
	INNER JOIN tblEpisodeEnemy AS EE ON EE.EpisodeId = EP.EpisodeId
	INNER JOIN tblEnemy AS EN ON EN.EnemyId = EE.EnemyId
	INNER JOIN tblDoctor AS DR ON DR.DoctorId = EP.DoctorId

WHERE
	YEAR(DR.BirthDate) < 1970

GROUP BY
	EN.EnemyName,
	YEAR(EP.EpisodeDate)

HAVING
	COUNT(*) > 1

ORDER BY
	[Number of episodes] DESC;