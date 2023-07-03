USE WorldEvents;
GO


ALTER FUNCTION fnVowelPlease(
    @vowel VARCHAR(1)
) RETURNS @vowel_summary TABLE (
    Information VARCHAR(100),
    Category VARCHAR(100)
) AS
BEGIN
    INSERT INTO @vowel_summary
    SELECT ContinentName, 'Continent' FROM tblContinent 
    WHERE ContinentName LIKE '%'+ @vowel +'%'

    INSERT INTO @vowel_summary
    SELECT CategoryName, 'Category' FROM tblCategory 
    WHERE CategoryName LIKE '%'+ @vowel +'%'

    INSERT INTO @vowel_summary
    SELECT CountryName, 'Country' FROM tblCountry 
    WHERE CountryName LIKE '%'+ @vowel +'%'
    
    
    RETURN
END
GO

SELECT
    (SELECT COUNT(*) FROM fnVowelPlease('A')) AS A_results,
    (SELECT COUNT(*) FROM fnVowelPlease('E')) AS E_results,
    (SELECT COUNT(*) FROM fnVowelPlease('I')) AS I_results,
    (SELECT COUNT(*) FROM fnVowelPlease('O')) AS O_results,
    (SELECT COUNT(*) FROM fnVowelPlease('U')) AS U_results;
