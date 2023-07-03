USE DoctorWho;
GO

ALTER FUNCTION fnEpisodesByDoctor(
    @DoctorName VARCHAR(100)
) RETURNS TABLE
AS
    RETURN (
        SELECT
            ep.EpisodeId,
            ep.Title,
            ep.SeriesNumber,
            ep.EpisodeNumber,
            au.AuthorName
        FROM
            tblEpisode AS ep
            INNER JOIN tblDoctor AS dr ON dr.DoctorId = ep.DoctorId
            INNER JOIN tblAuthor AS au ON au.AuthorId = ep.AuthorId
        WHERE
            dr.DoctorName LIKE '%'+@DoctorName +'%'
    )
GO

SELECT * FROM fnEpisodesByDoctor('Chris')



