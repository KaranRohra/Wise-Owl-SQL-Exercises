USE DoctorWho;
GO


CREATE TABLE tblProductionCompany(
    ProductionComapanyId int IDENTITY(1, 1) PRIMARY KEY,
    ProdutionCompanyName VARCHAR(100),
    Abbrevation VARCHAR(100)
)

INSERT INTO tblProductionCompany(
    ProdutionCompanyName,
    Abbrevation
) VALUES 
    ('British Broadcasing Corporation', 'BBC'),
    ('Canadian Broadcasing Corporation', 'BBC');


SELECT * FROM tblProductionCompany;

