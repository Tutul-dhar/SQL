
## NOTE

A subquery is a query inside another query. It is enclosed in parentheses and used to retrieve data that will be used in the main query.

🔹 Subqueries can be used in:

✔ SELECT statements

✔ WHERE clauses

✔ FROM clauses

✔ HAVING clauses

### 📌 1. Subquery in WHERE Clause

Find users whose salary is higher than the average salary:

        SELECT name, salary 
        FROM employees 
        WHERE salary > (SELECT AVG(salary) FROM employees);

🔹 Explanation:

- The subquery calculates the average salary.
- The main query selects users with salaries above that average.
  
### 📌 2. Subquery in SELECT Statement

Find each employee’s salary and how it compares to the company’s average salary:

        SELECT name, salary, 
                (SELECT AVG(salary) FROM employees) AS avg_salary
        FROM employees;

🔹 Explanation:

- The subquery calculates the average salary.
- The main query retrieves each employee’s salary alongside the average salary.

### 📌 3. Subquery in FROM Clause (Derived Table)

Find employees with the highest salary per department:

        SELECT department, MAX(salary) AS highest_salary 
        FROM (SELECT department, salary FROM employees) AS temp_table
        GROUP BY department;

🔹 Explanation:

- The subquery (temp_table) extracts department and salary.
- The main query groups data by department and finds the maximum salary.

### 📌 4. Subquery in HAVING Clause

Find departments where the average salary is greater than the overall company average salary

        SELECT department, AVG(salary) AS avg_salary 
        FROM employees 
        GROUP BY department 
        HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);



🔹 Explanation:

- The subquery finds the overall average salary.
- The main query filters departments where the average is higher than that value.

### 📌 5. EXISTS vs. IN in Subqueries

✅ Using IN (for Matching a List)

Find employees working in departments where at least one person earns more than $100,000:

        SELECT name, department 
        FROM employees 
        WHERE department IN (SELECT department FROM employees WHERE salary > 100000);

🔹 Explanation:

- The subquery gets departments with a salary over $100,000.
- The main query retrieves employees only in those departments.

✅ Using EXISTS (for Checking Existence)

Find employees who have at least one bonus recorded in another table:

        SELECT name 
        FROM employees e
        WHERE EXISTS (SELECT 1 FROM bonuses b WHERE b.employee_id = e.id);

🔹 Explanation:

- The subquery checks if a matching employee_id exists in the bonuses table.
- The main query selects only employees with a recorded bonus.

### 📌 6. ANY and ALL with Subqueries

✅ Using ANY (At Least One Match)
Find employees whose salary is greater than at least one manager's salary:

        SELECT name, salary 
        FROM employees 
        WHERE salary > ANY (SELECT salary FROM employees WHERE role = 'Manager');

🔹 Explanation:

- The subquery gets all manager salaries.
- The main query finds employees with salaries greater than at least one manager.

✅ Using ALL (Greater Than All)

Find employees earning more than all managers:

        SELECT name, salary 
        FROM employees 
        WHERE salary > ALL (SELECT salary FROM employees WHERE role = 'Manager');

🔹 Explanation:

- The subquery gets all manager salaries.
- The main query finds employees earning more than the highest manager salary.


### 🚀 Summary

✔ Subqueries are used to nest one query inside another

✔ Commonly used in WHERE, SELECT, FROM, and HAVING clauses

✔ Can be used with IN, EXISTS, ANY, and ALL for flexible filtering

✔ Performance Tip: Use JOIN instead of subqueries when possible for better efficiency

