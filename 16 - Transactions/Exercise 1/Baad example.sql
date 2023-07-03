USE DoctorWho;
GO

BEGIN TRANSACTION

INSERT INTO tblDoctor (
    DoctorName,
    DoctorNumber
) VALUES (
    'Shaun the sheep',
    13
)

IF 2 + 2 = 4
    ROLLBACK
ELSE
    COMMIT


SELECT
    DoctorId,
    DoctorNumber,
    DoctorName

FROM
    tblDoctor;


DELETE FROM tblDoctor WHERE DoctorNumber = 13;


