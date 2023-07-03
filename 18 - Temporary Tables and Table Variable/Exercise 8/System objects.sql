USE DoctorWho;
GO

SELECT * FROM sys.objects WHERE [type] IN ('P', 'FN') 
AND SCHEMA_ID = 1
ORDER BY name;
