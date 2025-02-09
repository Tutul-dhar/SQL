Problem Link: https://leetcode.com/problems/second-highest-salary/?envType=study-plan-v2&envId=top-sql-50

SELECT COALESCE(MAX(salary), null) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(a.salary)
    FROM Employee AS a
)
