USE WorldEvents;


-- FINAL QUERY
GO
SELECT
	F3.FamilyName AS GrandParent,
	F2.FamilyName AS Parent,
	F1.FamilyName AS Child,
	CONCAT(
		CASE
			WHEN F3.FamilyName IS NOT NULL THEN F3.FamilyName + ' > '
			ELSE ''
		END,
		CASE
			WHEN F2.FamilyName IS NOT NULL THEN F2.FamilyName + ' > ' 
			ELSE ''
		END,
		F1.FamilyName


	) AS [Family path]

FROM
	tblFamily AS F1
	LEFT JOIN tblFamily AS F2 ON F1.ParentFamilyId = F2.FamilyID
	LEFT JOIN tblFamily AS F3 ON F2.ParentFamilyId = F3.FamilyID

ORDER BY
	Child;



-- Full Table
GO
SELECT * FROM tblFamily;



-- First Trial
GO
SELECT
	F3.FamilyName AS GrandParent,
	F4.Parent,
	F4.Child, 
	CONCAT(F3.FamilyName, ' > ', F4.Parent, ' > ', F4.Child) AS [Family path]

FROM
	tblFamily AS F3
	INNER JOIN(
		SELECT 
			F1.FamilyName AS Child, F2.FamilyName AS Parent, F2.ParentFamilyId
		FROM 
			tblFamily AS F1
			INNER JOIN tblFamily AS F2 ON F2.FamilyID = F1.ParentFamilyId
		WHERE F2.ParentFamilyId IS NOT NULL
	) AS F4 ON F4.ParentFamilyId = F3.FamilyID

ORDER BY
	F4.Child;









