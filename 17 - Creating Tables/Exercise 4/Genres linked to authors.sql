USE Books;
GO


SELECT * FROM tblGenre;
GO

IF EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'tblAuthor' AND
        COLUMN_NAME = 'GenreId'
)
    ALTER TABLE tblAuthor DROP COLUMN GenreId;
GO

ALTER TABLE tblAuthor 
ADD GenreId INT NULL
CONSTRAINT FK_GenreId FOREIGN KEY(GenreId) REFERENCES tblGenre(GenreId);
GO

UPDATE tblAuthor
SET
    GenreId = 3
WHERE AuthorId = 1
GO

UPDATE tblAuthor
SET
    GenreId = 2
WHERE AuthorId = 2
GO

UPDATE tblAuthor
SET
    GenreId = 3
WHERE AuthorId = 3
GO

SELECT * FROM tblAuthor;
GO

SELECT
    au.FirstName,
    au.LastName,
    gn.GenreName
FROM 
    tblAuthor AS au
    INNER JOIN tblGenre AS gn ON au.GenreId = gn.GenreId;
