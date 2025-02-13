WITH Table1 AS (
    SELECT e.name, b.bonus
    FROM Employee e
    LEFT JOIN Bonus b
    ON e.empId = b.empId
)

SELECT name,bonus
FROM Table1
WHERE bonus < 1000 OR bonus IS NULL
