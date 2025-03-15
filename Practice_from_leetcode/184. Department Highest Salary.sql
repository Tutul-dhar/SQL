WITH max_salary AS (
    SELECT max(salary) AS salary, departmentId
    FROM Employee
    GROUP BY departmentId
),
employeeName AS (
    SELECT a.name, b.salary, b.departmentId
    FROM Employee AS a, max_salary AS b
    WHERE a.salary = b. salary AND a.departmentId = b.departmentId
)

SELECT a.name AS Department, b.name AS Employee, b.salary
FROM Department AS a, employeeName AS b
WHERE a.id = b.departmentId
