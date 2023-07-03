USE DoctorWho;
GO

IF OBJECT_ID('tempdb.dbo.#Character', 'U') IS NOT NULL
    DROP TABLE #Character

SELECT
    DoctorId AS [CharacterId],
    DoctorName AS [CharacterName],
    CAST('Doctor' AS varchar(100)) AS [ChracterType]

INTO
    #Character
FROM
    tblDoctor;

SET IDENTITY_INSERT #Character ON

INSERT INTO 
#Character (CharacterId, CharacterName, ChracterType)
SELECT
    EnemyId,
    EnemyName,
    'Enemy'
FROM
    tblEnemy;

INSERT INTO 
#Character
SELECT
    CompanionId,
    CompanionName,
    'Companion'
FROM
    tblCompanion;

SET IDENTITY_INSERT #Character OFF
GO


SELECT * FROM #Character;
