
## NOTE

### 1. Sorting with ORDER BY
The `ORDER BY` clause sorts the result set by one or more columns. You can specify whether the sorting should be in ascending (`ASC`) or descending (`DESC`) order.

Syntax:

        SELECT column1, column2
        FROM table_name
        ORDER BY column1 [ASC|DESC], column2 [ASC|DESC];
- `ASC (default)`: Ascending order (smallest to largest, A-Z).
- `DESC`: Descending order (largest to smallest, Z-A).

Example:

        SELECT first_name, last_name, age
        FROM employees
        ORDER BY age DESC, last_name ASC;

This will sort employees by age in descending order, and if two employees have the same age, it will then sort by last name in ascending order.

### 2. Grouping with GROUP BY
The `GROUP BY` clause groups rows that have the same values in specified columns into summary rows, like "total" or "average".

Syntax:

        SELECT column1, aggregate_function(column2)
        FROM table_name
        GROUP BY column1;

Common aggregate functions include:

- `COUNT()`: Counts the number of rows.
- `SUM()`: Sums the values.
- `AVG()`: Averages the values.
- `MAX() / MIN()`: Returns the maximum or minimum value.

Example:

        SELECT department, COUNT(*)
        FROM employees
        GROUP BY department;
This will return the number of employees in each department.

### 3. Combining ORDER BY and GROUP BY
You can use both `ORDER BY` and `GROUP BY` in the same query. Group the data first and then sort it.

Example:

        SELECT department, AVG(salary)
        FROM employees
        GROUP BY department
        ORDER BY AVG(salary) DESC;
This will give the average salary per department, sorted by the highest average salary.

### 4. Filtering Groups with HAVING
The `HAVING` clause is used to filter groups created by `GROUP BY`, while `WHERE` filters rows before grouping.

Syntax:

        SELECT column1, aggregate_function(column2)
        FROM table_name
        GROUP BY column1
        HAVING aggregate_function(column2) condition;
Example:

        SELECT department, AVG(salary)
        FROM employees
        GROUP BY department
        HAVING AVG(salary) > 50000;
This will return only the departments where the average salary is greater than 50,000.
