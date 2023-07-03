USE WorldEvents;

GO
DECLARE @name VARCHAR(50) = 'Karan Rohra';

DECLARE @birthDate DATETIME;
SET @birthDate = '2001-08-03';

DECLARE @petCount INT;
SELECT @petCount = 8;

SELECT CONCAT(
	'My name is ', @name,
	', I was born in ', @birthDate,
	' and I have ', @petCount, ' pets'
) AS [Fun facts]