USE DoctorWho;


GO
SELECT
	AU.AuthorName, 
	DR.DoctorName,
	COUNT(*) AS [Episodes]

FROM 
	tblAuthor AS AU
	INNER JOIN tblEpisode AS EP ON EP.AuthorId = AU.AuthorId
	INNER JOIN tblDoctor AS DR ON DR.DoctorId = EP.DoctorId

GROUP BY
	AU.AuthorName,
	DR.DoctorName

HAVING
	COUNT(*) > 5

ORDER BY
	Episodes DESC;