USE WorldEvents;

GO


SELECT Country, 
	KmSquared, (KmSquared / 20761) AS WalesUnits,
	KmSquared % 20761 AS AreaLeftOver,
	CASE
		WHEN KmSquared < 20761 THEN 'Smaller than Wales'

		ELSE CONCAT(KmSquared / 20761, ' X Wales plus ', KmSquared % 20761, ' sq. km.') 
		END AS WalesComparision 
FROM CountriesByArea
ORDER BY ABS(KmSquared - 20761);
