USE DoctorWho;

-- LIST ALL OF THE EPISDOES WHICH HAD ONLY A SINGLE COMPANION
GO
CREATE VIEW vwEpisodeCompanion
AS
SELECT 
	EP.EpisodeId,
	MAX(EP.Title) AS Title

FROM 
	tblEpisodeCompanion AS EC
	INNER JOIN tblEpisode AS EP ON EP.EpisodeId = EC.EpisodeId

GROUP BY
	EP.EpisodeId

HAVING
	COUNT(*) = 1;


-- LIST ALL OF THE EPISODE WHICH HAD ONLY A SINGLE ENEMY
GO
CREATE VIEW vwEpisodeEnemy
AS
SELECT
	EP.EpisodeId,
	EP.Title

FROM
	tblEpisodeEnemy AS EE
	INNER JOIN tblEpisode AS EP ON EP.EpisodeId = EE.EpisodeId

GROUP BY
	EP.EpisodeId, 
	EP.Title

HAVING
	COUNT(*) = 1;


-- LIST ALL OF THE EPISODES WHICH HAVE NO CORRESPONDING ROWS IN EITHER THE vwEpisodeCompanion or vwEpisodeEnemy
GO
CREATE VIEW vwEpisodeSummary
AS
SELECT
	EpisodeId,
	Title

FROM
	tblEpisode

WHERE
	EpisodeId NOT IN (SELECT EpisodeId FROM vwEpisodeCompanion) AND
	EpisodeId NOT IN (SELECT EpisodeId FROM vwEpisodeEnemy);

GO
CREATE VIEW vwEpisodeSummary_Owl
AS
SELECT
	EP.EpisodeId,
	EP.Title

FROM
	tblEpisode AS EP
	LEFT JOIN vwEpisodeCompanion AS VEC ON VEC.EpisodeId = EP.EpisodeId
	LEFT JOIN vwEpisodeEnemy AS VEE ON VEE.EpisodeId = EP.EpisodeId

WHERE
	VEC.EpisodeId IS NULL AND
	VEE.EpisodeId IS NULL;

GO
-- SELECT ALL FROM vwEpisodeSummary
SELECT * FROM vwEpisodeSummary ORDER BY Title;

GO
SELECT * FROM vwEpisodeSummary_Owl ORDER BY Title;