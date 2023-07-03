USE WorldEvents;

SELECT
	EventName,
	EventDetails

FROM 
	tblEvent

WHERE
	CountryID NOT IN (
		SELECT TOP 30 CountryID
		FROM tblCountry
		ORDER BY CountryName DESC
	) AND

	CategoryID NOT IN (
		SELECT TOP 15 CategoryID
		FROM tblCategory
		ORDER BY CategoryName DESC
	)

ORDER BY
	EventDate;