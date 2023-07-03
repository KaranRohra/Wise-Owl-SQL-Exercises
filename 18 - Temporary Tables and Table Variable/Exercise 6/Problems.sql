USE DoctorWho;
GO

DECLARE @DeleteND TABLE (
    ProblemId INT IDENTITY,
    TableName VARCHAR(max),
    id INT,
    ColumnName VARCHAR(max),
    ColumnValue VARCHAR(max),
    ProblemName VARCHAR(max)
)

INSERT INTO @DeleteND (
    TableName,
    id,
    ColumnName,
    ColumnValue,
    ProblemName
)(
    SELECT
        'tblEnemy',
        EnemyId,
        'Description',
        [Description],
        CONCAT('Description has ', LEN([Description]), ' letters')

    FROM tblEnemy
    WHERE LEN([Description]) > 75
) UNION (
    SELECT
        'tblEpisode',
        EpisodeId,
        'Notes',
        [Notes],
        'Notes field filled in'

    FROM tblEpisode
    WHERE Notes IS NOT NULL
)


SELECT * FROM @DeleteND;

