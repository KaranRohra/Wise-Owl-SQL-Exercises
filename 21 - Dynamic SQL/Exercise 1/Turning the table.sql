USE WorldEvents;
GO

ALTER PROC sp_dynamic_table_name (
    @TableName VARCHAR(max)
)
AS
    DECLARE @sql VARCHAR(max) = 'SELECT * FROM ' + @TableName
    EXEC sp_sqlexec @sql
GO

EXEC sp_dynamic_table_name @TableName = 'tblCountry'

