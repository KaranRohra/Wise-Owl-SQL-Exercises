USE DoctorWho;

GO
DECLARE @EpisodeId int = 42;
DECLARE @EpisodeName varchar(100) = (
	SELECT Title FROM tblEpisode WHERE EpisodeId = @EpisodeId
);
DECLARE @NumberCompanions int = (
	SELECT COUNT(*) FROM tblEpisodeCompanion GROUP BY EpisodeId HAVING EpisodeId = @EpisodeId
);
DECLARE @NumberEnemies int = (
	SELECT COUNT(*) FROM tblEpisodeEnemy GROUP BY EpisodeId HAVING EpisodeId = @EpisodeId
);


SELECT
	@EpisodeName AS Title,
	@EpisodeId AS [Episode id],
	@NumberCompanions AS [Number of companions],
	@NumberEnemies AS [Number of enemies]