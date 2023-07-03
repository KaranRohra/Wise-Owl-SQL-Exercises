USE WorldEvents;
GO

ALTER TRIGGER StopUKEventFromDelete
ON tblEvent
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @EventId INT;
    DECLARE @CountryID INT;

    SELECT
        @EventId = d.EventID,
        @CountryID = d.CountryID
    FROM
        deleted AS d

    IF @CountryID <> 7
    BEGIN
        DELETE tblEvent
        WHERE EventID = @EventId
    END
    ELSE
        PRINT 'UK events can be delete';
END
GO

-- Temp rows created
SET IDENTITY_INSERT tblEvent ON;

INSERT INTO tblEvent (
    EventID, 
    EventName, 
    EventDetails, 
    EventDate,
    CountryID,
    CategoryID
) VALUES 
    (1000, 'Uk Karan', 'Karan Rocks', '2023-08-03', 7, 1),
    (1001, 'India Karan', 'Karan Rocks', '2023-08-03', 1, 1);
SET IDENTITY_INSERT tblEvent OFF;


SELECT * FROM tblEvent WHERE EventID IN (1000, 1001);

-- DELETING UK Event
DELETE FROM tblEvent
WHERE EventID = 1000;

-- DELETING Non UK Event
DELETE FROM tblEvent
WHERE EventID = 1001;

SELECT * FROM tblEvent WHERE EventID IN (1000, 1001);


-- Temp rows deleted
DELETE FROM tblEvent
WHERE EventID IN (1000, 1001);

