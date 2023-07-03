USE DoctorWho;

GO
ALTER PROC spGoodAndBad
	@SeriesNumber int = NULL,
	@NumEnemies int output,
	@NumCompanions int output
AS
BEGIN
	SELECT
		@NumCompanions = COUNT(DISTINCT EC.CompanionId),
		@NumEnemies = COUNT(DISTINCT EE.EnemyId)
	FROM
		tblEpisode AS EP
		INNER JOIN tblEpisodeCompanion AS EC ON EP.EpisodeId = EC.EpisodeId
		INNER JOIN tblEpisodeEnemy AS EE ON EE.EpisodeId = EP.EpisodeId
	WHERE 
		EP.SeriesNumber = @SeriesNumber OR
		@SeriesNumber IS NULL;

END

GO
DECLARE @NumEnemies int;
DECLARE @NumCompanions int;
DECLARE @SeriesNumber int = 1

EXEC spGoodAndBad @SeriesNumber, @NumEnemies output, @NumCompanions output;


SELECT
	@SeriesNumber AS [Series Number],
	@NumEnemies AS [Number of enemies],
	@NumCompanions AS [Number of companions];

