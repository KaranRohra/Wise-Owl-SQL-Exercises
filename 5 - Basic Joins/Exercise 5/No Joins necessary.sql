USE DoctorWho;

GO
SELECT AU.AuthorName, EP.Title, EP.EpisodeType
FROM tblAuthor AS AU
INNER JOIN tblEpisode AS EP ON EP.AuthorId = AU.AuthorId
WHERE EP.EpisodeType LIKE '%SPECIAL%'
ORDER BY EP.Title;

