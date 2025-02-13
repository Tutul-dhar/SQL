SELECT a.id
FROM Weather a
JOIN Weather b
ON DATEDIFF(a.recordDate,b.recordDate) = 1 
WHERE a.temperature > b.temperature
