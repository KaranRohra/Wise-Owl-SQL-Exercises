USE DoctorWho;

GO
SELECT 
	AU.AuthorName,
	COUNT(*) AS [Episodes],
	MIN(EP.EpisodeDate) AS [Earliest date],
	MAX(EP.EpisodeDate) AS [Latest date]

FROM 
	tblAuthor AS AU
	INNER JOIN tblEpisode AS EP ON EP.AuthorId = AU.AuthorId

GROUP BY
	AU.AuthorId,
	AU.AuthorName

ORDER BY
	Episodes DESC;

