USE WorldEvents;

-- OWL QUERY
GO
SELECT 
	LEFT(CT.CategoryName, 1) AS [Category initial],
	COUNT(*) AS [Number of events],
	FORMAT(
		AVG(
			CAST(
				LEN(EV.EventName) AS float
			)
		),
		'0.00'
	) AS [Average event name length]

FROM 
	tblEvent AS EV
	INNER JOIN tblCategory AS CT ON CT.CategoryID = EV.CategoryID

GROUP BY
	LEFT(CT.CategoryName, 1)

-- MY QUERY
GO
SELECT 
	T.[Category initial],
	COUNT(*) AS [Number of events],
 	ROUND(AVG(CAST(T.[Event name len] AS float)), 2) AS [Average event name length]

FROM (
	SELECT
		UPPER(LEFT(CT.CategoryName, 1)) AS [Category initial],
		LEN(EV.EventName) AS [Event name len]

	FROM
		tblEvent AS EV
		INNER JOIN tblCategory AS CT ON CT.CategoryID = EV.CategoryID
) AS T

GROUP BY T.[Category initial]




