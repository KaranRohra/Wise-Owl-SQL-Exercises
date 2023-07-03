USE DoctorWho;
GO

ALTER FUNCTION fnMonthName(
    @Month INT
) RETURNS VARCHAR(30)
AS
BEGIN
    RETURN DATENAME(MM, CONCAT('2023-', @Month, '-03'))
END
GO

SELECT
    BirthDate,
    dbo.fnMonthName(MONTH(BirthDate)) AS [Month name]
FROM
    tblDoctor;
GO