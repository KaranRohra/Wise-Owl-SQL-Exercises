USE WorldEvents;

GO
SELECT
	CT.CategoryName,
	COUNT(*) AS [Number of events]

FROM 
	tblEvent AS EV
	INNER JOIN tblCategory AS CT ON CT.CategoryID = EV.CategoryID

GROUP BY
	CT.CategoryName

ORDER BY
	[Number of events] DESC;