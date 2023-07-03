USE DoctorWho;
GO

DECLARE @Character TABLE (
    CharacterId INT,
    CharacterName VARCHAR(100),
    CharacterType VARCHAR(100)
);

INSERT INTO @Character (
    CharacterId,
    CharacterName,
    CharacterType
)(
    SELECT
        DoctorId,
        DoctorName,
        'Doctor'
    FROM 
        tblDoctor
) UNION (
    SELECT
        EnemyId,
        EnemyName,
        'Enemy'
    FROM
        tblEnemy
) UNION (
    SELECT
        CompanionId,
        CompanionName,
        'Companion'
    FROM tblCompanion
)

SELECT * FROM @Character ORDER BY CharacterName DESC;