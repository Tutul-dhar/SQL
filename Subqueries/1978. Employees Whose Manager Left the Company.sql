
SELECT employee_id
FROM Employees
WHERE salary < 30000 AND (manager_id=NULL OR
    manager_id NOT IN (
        SELECT a.employee_id
        FROM Employees AS a
    )
)
ORDER BY employee_id
