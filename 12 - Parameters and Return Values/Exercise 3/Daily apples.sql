USE DoctorWho;


GO
ALTER PROC spCompanionsForDoctor(
	@doctor varchar(100) = ''
)
AS
SELECT
	DISTINCT CP.CompanionName

FROM
	tblCompanion AS CP
	INNER JOIN tblEpisodeCompanion AS EC ON EC.CompanionId = CP.CompanionId
	INNER JOIN tblEpisode AS EP ON EP.EpisodeId = EC.EpisodeId
	INNER JOIN tblDoctor AS DR ON DR.DoctorId = EP.DoctorId
	
WHERE
	DR.DoctorName LIKE '%' + @doctor +'%';


GO
EXEC spCompanionsForDoctor;

GO
EXEC spCompanionsForDoctor @doctor = 'Ecc';


