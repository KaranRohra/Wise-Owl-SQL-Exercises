USE DoctorWho;
GO

ALTER FUNCTION fnChosenEpisodes (
    @Series INT,
    @AuthorName VARCHAR(100)
) RETURNS TABLE
AS
    RETURN
        SELECT 
            Title, AuthorName, DoctorName
        FROM 
            tblEpisode AS ep 
            INNER JOIN tblAuthor AS au ON au.AuthorId = ep.AuthorId 
            INNER JOIN tblDoctor AS dr ON dr.DoctorId = ep.DoctorId
        WHERE 
            (SeriesNumber = @Series OR @Series IS NULL) AND 
            (au.AuthorName LIKE '%'+ @AuthorName +'%' OR @AuthorName IS NULL)
GO

SELECT COUNT(*) FROM fnChosenEpisodes(2, 'moffat')
SELECT COUNT(*) FROM fnChosenEpisodes(2, null)
SELECT COUNT(*) FROM fnChosenEpisodes(null, 'moffat')
SELECT COUNT(*) FROM fnChosenEpisodes(null, null)
