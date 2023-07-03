USE DoctorWho;
GO

ALTER FUNCTION fnEpisodeDescription(
	@Title VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN (
		CASE
			WHEN @Title LIKE '%Part 1%' THEN 'First part'
			WHEN @Title LIKE '%Part 2%' THEN 'Second part'
			ELSE 'Single episodes'
		END
	);
END
GO


SELECT
	dbo.fnEpisodeDescription(Title) AS [Eiposde type],
	COUNT(*) AS [Number of episodes]
FROM
	tblEpisode

GROUP BY
	dbo.fnEpisodeDescription(Title);
GO