USE WorldEvents;

GO
SELECT * FROM tblEvent
WHERE EventName LIKE '%Teletubbies%'  OR 
	EventName LIKE '%Pandy%';
