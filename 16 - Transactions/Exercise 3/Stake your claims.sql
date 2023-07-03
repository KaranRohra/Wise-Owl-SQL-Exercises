USE WorldEvents;
GO


BEGIN TRANSACTION

UPDATE tblCountry
SET
    [CountryName] += ' (My Country - INDIA)'
WHERE 
    CountryName = 'Japan'

UPDATE tblCountry
SET
    [CountryName] += ' (Holiday Destination)'
WHERE 
    CountryName NOT LIKE '%Japan%'

IF 1 + 1 = 3
    ROLLBACK
ELSE
BEGIN
    SELECT * FROM tblCountry;
    COMMIT
END
GO


UPDATE tblCountry
SET
    CountryName = REPLACE(CountryName, ' (Holiday Destination)', '');
GO

UPDATE tblCountry
SET
    CountryName = REPLACE(CountryName, ' (My Country - INDIA)', '');
GO

