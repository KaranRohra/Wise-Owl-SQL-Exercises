USE DoctorWho;

GO
SELECT DR.DoctorName, EP.Title
FROM tblEpisode AS EP
INNER JOIN tblDoctor AS DR ON DR.DoctorId = EP.DoctorId
WHERE YEAR(EP.EpisodeDate) = 2010;

