USE [WorldEvents]
GO

/****** Object:  View [dbo].[EventsByCategory]    Script Date: 13-06-2023 12:22:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[EventsByCategory]
AS
SELECT
	TOP (100) PERCENT 
	dbo.tblCategory.CategoryName AS Category, 
	COUNT(dbo.tblEvent.EventName) AS What

FROM
	dbo.tblCategory 
	INNER JOIN dbo.tblEvent ON dbo.tblCategory.CategoryID = dbo.tblEvent.CategoryID

GROUP BY 
	dbo.tblCategory.CategoryName

ORDER BY 
	What;
GO


SELECT
	*

FROM
	EventsByCategory

WHERE
	What > 50;
GO