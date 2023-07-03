USE DoctorWho;
GO


ALTER TABLE tblEpisode
    ADD NumberEnemies int;
GO


SELECT * FROM tblEpisode;
GO


BEGIN TRANSACTION
UPDATE
    tblEpisode

SET
    NumberEnemies = (
        SELECT COUNT(*) FROM tblEpisodeEnemy AS EE
        WHERE EE.EpisodeId = UE.EpisodeId
    )

FROM
    tblEpisode AS UE;

DECLARE @RowsEffected INT = @@RowCount;


IF @RowsEffected > 120
BEGIN
    ROLLBACK
    PRINT CONCAT(@RowsEffected, ' rows updated, but change rolled back')
END
ELSE
BEGIN
    COMMIT
    SELECT
        EpisodeId,
        Title,
        NumberEnemies
    FROM
        tblEpisode
END
GO

