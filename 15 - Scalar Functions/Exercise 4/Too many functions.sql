USE DoctorWho;
GO

ALTER FUNCTION fnNumberCompanions(
    @EpisodeId INT
)
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM tblEpisodeCompanion WHERE EpisodeId = @EpisodeId)
END;
GO


ALTER FUNCTION fnNumberEnemies(
    @EpisodeId INT
)
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM vwEpisodeEnemy WHERE EpisodeId = @EpisodeId)
END;
GO

ALTER FUNCTION fnWords(
    @Title VARCHAR(MAX)
)
RETURNS INT
BEGIN
    DECLARE @WithoutSpaces VARCHAR(100) = REPLACE(TRIM(@Title), ' ', '')

    RETURN LEN(@Title) - LEN(@WithoutSpaces) + 1;
END
GO


SELECT
    EpisodeId,
    Title,
    dbo.fnNumberCompanions(EpisodeId) AS Companions,
    dbo.fnNumberEnemies(EpisodeId) AS Enemies,
    dbo.fnWords(Title) AS Words

FROM 
    tblEpisode

ORDER BY
    Words DESC;
GO