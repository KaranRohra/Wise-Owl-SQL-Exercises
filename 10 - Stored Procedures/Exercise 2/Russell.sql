USE DoctorWho;

-- STEVEN MOFFATS
GO
CREATE PROC spMoffats
AS
SELECT
	EP.Title,
	EP.EpisodeDate,
	AU.AuthorName

FROM 
	tblEpisode AS EP
	INNER JOIN tblAuthor AS AU ON AU.AuthorId = EP.AuthorId

WHERE
	AU.AuthorName = 'Steven Moffat'

ORDER BY
	EP.EpisodeDate DESC;

-- RUSSELL
GO
CREATE PROC spRussell
AS
SELECT
	EP.Title,
	EP.EpisodeDate,
	AU.AuthorName

FROM 
	tblEpisode AS EP
	INNER JOIN tblAuthor AS AU ON AU.AuthorId = EP.AuthorId

WHERE
	AU.AuthorName LIKE '%Russell%'

ORDER BY
	EP.EpisodeDate DESC;


GO
EXEC spMoffats;

GO
EXEC spRussell;
