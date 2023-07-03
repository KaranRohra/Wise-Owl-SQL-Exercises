USE WorldEvents;
GO


BEGIN TRAN [Insert My DOB]

IF (SELECT EventID FROM tblEvent WHERE EventName = 'My DOB') IS NULL
BEGIN
    INSERT INTO tblEvent (EventName, EventDetails, EventDate)
    VALUES ('My DOB', 'I was born and the world trembles', '2001-08-03')

    SELECT 'This momentous event has now been added' AS [Event Results]
    COMMIT TRAN [Insert My DOB]
END
ELSE
BEGIN
    SELECT 'This magnificent event already exists' AS [Event Results]
    ROLLBACK TRAN [Insert My DOB]
END

SELECT * FROM tblEvent WHERE EventName = 'My DOB';

-- DELETE FROM tblEvent
-- WHERE EventName = 'My DOB';
