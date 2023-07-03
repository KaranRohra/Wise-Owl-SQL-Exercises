USE Books;
GO

ALTER PROC spGenreTable -- Create a new table called 'tblGenre' in schema 'Books'
AS
-- Drop the table if it already exists
IF OBJECT_ID('dbo.tblGenre', 'U') IS NOT NULL
DROP TABLE dbo.tblGenre
-- Create the table in the specified schema
CREATE TABLE dbo.tblGenre
(
    GenreId INT NOT NULL PRIMARY KEY, -- primary key column
    GenreName [NVARCHAR](50) NOT NULL,
    Rating [NVARCHAR](50) CHECK (Rating BETWEEN 1 AND 10)
);
GO

EXEC spGenreTable;
SELECT * FROM dbo.tblGenre;
GO

INSERT INTO tblGenre (GenreId, GenreName, Rating)
VALUES 
(1, 'Romance', 3),
(2, 'Science Fiction', 8),
(3, 'Thriller', 5),
(4, 'Humour', 6);
GO

