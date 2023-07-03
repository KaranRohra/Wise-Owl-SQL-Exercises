USE WorldEvents;

GO
SELECT * FROM tblEvent
WHERE (
		-- One of the Following Countries
		CountryID IN (8, 22, 30, 35) OR 

		-- Different Combination of Word Water
		EventDetails LIKE '% Water %' OR -- Middle
		EventDetails LIKE 'Water %' OR -- Start
		EventDetails LIKE '% Water' OR -- End

		-- Natural World Category
		CategoryID = 4
	) AND YEAR(EventDate)>=1970;
