USE DoctorWho;

GO
SELECT 
	AU.AuthorName, 
	EP.Title, 
	DR.DoctorName, 
	EN.EnemyName,
	(LEN(AU.AuthorName) + LEN(EP.Title) + LEN(DR.DoctorName) + LEN(EN.EnemyName)) AS [Total Length]

FROM
	tblAuthor AS AU
	INNER JOIN tblEpisode AS EP ON EP.AuthorId = AU.AuthorId
	INNER JOIN tblDoctor AS DR ON DR.DoctorId = EP.DoctorId
	INNER JOIN tblEpisodeEnemy AS EE ON EE.EpisodeId = EP.EpisodeId
	INNER JOIN tblEnemy AS EN ON EN.EnemyId = EE.EnemyId

WHERE 
	LEN(AU.AuthorName) + LEN(EP.Title) + LEN(DR.DoctorName) + LEN(EN.EnemyName) < 40 

ORDER BY 
	EP.SeriesNumber, EP.EpisodeNumber;