WITH table1 AS (
    SELECT a.name,a.salary,a.departmentId
    FROM Employee AS a
    WHERE  (
        SELECT COUNT(*)
        FROM (
            SELECT DISTINCT(b.salary) AS salary
            FROM Employee AS b
            WHERE a.departmentId = b.departmentId
        ) AS c
        WHERE c.salary >= a.salary
    ) <= 3
)

-- SELECT *
-- FROM table1

SELECT b.name AS Department, a.name AS Employee, a.salary AS Salary
FROM table1 AS a, Department AS b
WHERE a.departmentId = b.id
