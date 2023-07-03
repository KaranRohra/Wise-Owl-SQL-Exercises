USE WorldEvents;
GO

DECLARE @list VARCHAR(max) = '';

SELECT 
    @list += QUOTENAME(EventName, '''') + ',' 

FROM 
    tblEvent 

WHERE 
    YEAR(EventDate) BETWEEN 1980 AND 1989;



SET @list = LEFT(@list, LEN(@list) - 1);

SELECt @list;


DECLARE @sql VARCHAR(max) = 
    'SELECT * FROM tblEvent WHERE EventName IN (' + @list + ')';


EXEC(@sql);
GO