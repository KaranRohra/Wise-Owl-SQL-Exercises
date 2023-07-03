USE DoctorWho;

GO
ALTER PROC spSummariseEpisodes
AS
SELECT TOP 5
	CP.CompanionName,
	COUNT(*) [Episodes]

FROM 
	tblEpisodeCompanion AS EC
	INNER JOIN tblCompanion AS CP ON CP.CompanionId = EC.CompanionId

GROUP BY
	CP.CompanionName

ORDER BY
	Episodes

SELECT TOP 5
	EN.EnemyName,
	COUNT(*) [Episodes]

FROM 
	tblEpisodeEnemy AS EE
	INNER JOIN tblEnemy AS EN ON EN.EnemyId = EE.EnemyId

GROUP BY
	EN.EnemyName

ORDER BY
	Episodes;



GO
EXEC spSummariseEpisodes;