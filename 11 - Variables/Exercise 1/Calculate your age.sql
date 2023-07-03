USE WorldEvents;
GO
ALTER PROC spCalculateAge
AS
DECLARE @Age Int
SET @Age = DATEDIFF(YEAR, '2001-08-01', GETDATE())
PRINT CONCAT('YOUR AGE IS ', @Age, ' YEARS');

GO
exec spCalculateAge;
