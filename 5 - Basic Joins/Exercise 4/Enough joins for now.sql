USE DoctorWho;

GO
SELECT AU.AuthorName
FROM tblAuthor AS AU
INNER JOIN tblEpisode AS EP ON EP.AuthorId = AU.AuthorId
INNER JOIN tblEpisodeEnemy AS EE ON EE.EpisodeId = EP.EpisodeId
INNER JOIN tblEnemy AS EN ON EN.EnemyId = EE.EnemyId
WHERE EN.EnemyName = 'Daleks';


