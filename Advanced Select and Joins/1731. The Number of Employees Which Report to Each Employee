WITH Table1 AS (
    SELECT reports_to,COUNT(*) AS reports_count, ROUND(AVG(age),0) AS average_age
    FROM Employees
    GROUP BY reports_to
    HAVING reports_to IS NOT NULL
)
SELECT a.employee_id, a.name, t.reports_count, t.average_age
FROM Employees AS a
JOIN Table1 AS t
WHERE a.employee_id = t.reports_to
ORDER BY a.employee_id
