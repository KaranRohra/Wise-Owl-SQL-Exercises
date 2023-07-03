USE WorldEvents;
GO


CREATE TABLE tblCountryLog(
    CountryName VARCHAR(max),
    Change VARCHAR(max)
)
GO


CREATE TRIGGER trgCountryUpdate
ON tblCountry
AFTER UPDATE
AS
BEGIN
    INSERT INTO tblCountryLog
    SELECT d.CountryName, 'Previous Name' FROM deleted AS d

    INSERT INTO tblCountryLog
    SELECT i.CountryName, 'New Name' FROM inserted AS i
END
GO


CREATE TRIGGER trgCountryDelete
ON tblCountry
AFTER DELETE
AS
BEGIN
    INSERT INTO tblCountryLog
    SELECT d.CountryName, 'Deleted' FROM deleted AS d
END
GO

CREATE TRIGGER trgCountryInsert
ON tblCountry
AFTER INSERT
AS
BEGIN
    INSERT INTO tblCountryLog
    SELECT i.CountryName, 'Inserted' FROM inserted AS i
END
GO

-- Execution of Triggers happends

SET IDENTITY_INSERT tblCountry ON;

-- INSERT
INSERT INTO tblCountry (
    CountryID, ContinentID, CountryName
) VALUES (
    1382, NULL, 'Karan Island'
)

SET IDENTITY_INSERT tblCountry OFF;

-- UPDATE
UPDATE tblCountry
SET CountryName = REPLACE(CountryName, 'Karan', 'Rohra')
WHERE CountryID = 1382;

-- DELETE
DELETE FROM tblCountry WHERE CountryID = 1382;
GO


SELECT * FROM tblCountryLog;
GO


DROP TABLE tblCountryLog;
GO