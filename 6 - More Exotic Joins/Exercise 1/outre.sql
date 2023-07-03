USE DoctorWho;


GO
SELECT
	CP.CompanionName

FROM 
	tblCompanion AS CP
	LEFT JOIN tblEpisodeCompanion AS EC ON EC.CompanionId = CP.CompanionId

WHERE
	EC.EpisodeCompanionId IS NULL;


