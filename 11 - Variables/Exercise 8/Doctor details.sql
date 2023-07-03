USE DoctorWho;

GO
DECLARE @DoctorNumber int = 1;

DECLARE @DoctorName varchar(100) = (SELECT UPPER(DoctorName) FROM tblDoctor WHERE DoctorId = @DoctorNumber);

DECLARE @EpisodeId int = (SELECT COUNT(*) FROM tblEpisode WHERE DoctorId = @DoctorNumber);


PRINT 'Results for doctor number ' + CAST(@DoctorNumber AS VARCHAR(10));;
PRINT '-------------------------------------------';
PRINT '';
PRINT 'Doctor name: ' + @DoctorName
PRINT 'Episodes appeared in: ' + CAST(@EpisodeId AS VARCHAR(10));