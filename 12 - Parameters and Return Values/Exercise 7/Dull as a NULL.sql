USE WorldEvents;
GO


ALTER PROC spEventCategory(
	@CategoryName varchar(100) = NULL,
	@After DATETIME = NULL,
	@CategoryId INT = NULL
)
AS
BEGIN
	SELECT
		CAT.CategoryName,
		EV.EventDate,
		CAT.CategoryID

	FROM
		tblCategory AS CAT
		INNER JOIN tblEvent AS EV ON EV.CategoryID = CAT.CategoryID
	
	WHERE
		(@CategoryName IS NULL OR CAT.CategoryName LIKE '%'+ @CategoryName +'%') AND
		(@After IS NULL OR EV.EventDate >= @After) AND
		(@CategoryId IS NULL OR CAT.CategoryID = @CategoryId)
	ORDER BY
		EV.EventDate;
END
GO


EXEC spEventCategory @CategoryName = 'death', @After = '19900101';
EXEC spEventCategory @CategoryId = 16;