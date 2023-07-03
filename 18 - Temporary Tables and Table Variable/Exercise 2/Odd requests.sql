USE WorldEvents;
GO

DECLARE @OddCountries TABLE (
    CountryName VARCHAR(100),
    CountryId INT
)

INSERT INTO @OddCountries
SELECT CountryName, CountryID 
FROM tblCountry WHERE CountryID % 2 <> 0;


SELECT * FROM @OddCountries ORDER BY CountryId DESC;

SELECT
    ev.EventName,
    oc.CountryName
FROM
    tblEvent AS ev
    INNER join @OddCountries AS oc ON oc.CountryId = ev.CountryID

WHERE
    ev.EventName NOT LIKE '%'+ CountryName +'%' AND
    RIGHT(ev.EventName, 1) = RIGHT(oc.CountryName, 1);
