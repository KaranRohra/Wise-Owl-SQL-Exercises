USE WorldEvents;
GO

DECLARE @Continent VARCHAR(100) = 'Westeros';

SET IDENTITY_INSERT tblContinent ON;

INSERT INTO tblContinent (ContinentID, ContinentName)
VALUES (9, @Continent);

SET IDENTITY_INSERT tblContinent OFF;

SELECT * FROM tblContinent ORDER BY ContinentID DESC;


BEGIN TRANSACTION

DELETE tblContinent
WHERE ContinentName = @Continent

IF LEFT(@Continent, 1) = 'K'
BEGIN
    PRINT 'You have died';
    ROLLBACK
    
    UPDATE tblContinent
    SET ContinentName = 'Seven Kingdoms'
    WHERE ContinentName = @Continent

END
ELSE
BEGIN
    PRINT 'You have won'
    COMMIT
END
SELECT * FROM tblContinent ORDER BY ContinentID DESC;

