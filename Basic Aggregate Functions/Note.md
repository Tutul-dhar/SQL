
## NOTE

### Basic Aggregate Functions in MySQL

Aggregate functions perform calculations on a set of values and return a single value. These functions are often used in combination with the GROUP BY clause to summarize data.

Here are the basic aggregate functions in MySQL:

### 1. COUNT()
- Purpose: Counts the number of rows or non-NULL values.
- Syntax:
        
        COUNT(*) – Counts all rows.
        COUNT(column_name) – Counts non-NULL values in a specific column.

Example:

        SELECT COUNT(*) AS total_students FROM students;

### 2. SUM()
- Purpose: Returns the total sum of a numeric column.
- Syntax:

        SUM(column_name)

Example:

        SELECT SUM(amount) AS total_amount FROM transactions;

### 3. AVG()
- Purpose: Returns the average value of a numeric column.
- Syntax:

        AVG(column_name)
Example:

        SELECT AVG(salary) AS average_salary FROM employees;

### 4. MIN()
- Purpose: Returns the smallest (minimum) value from a column.
- Syntax:

        MIN(column_name)
Example:

        SELECT MIN(price) AS lowest_price FROM products;

### 5. MAX()
- Purpose: Returns the largest (maximum) value from a column.
- Syntax:

        MAX(column_name)
Example:

        SELECT MAX(age) AS oldest_employee FROM employees;

### 6. GROUP_CONCAT()
- Purpose: Concatenates values from multiple rows into a single string, separated by commas (or a specified separator).
- Syntax:

        GROUP_CONCAT(column_name SEPARATOR 'separator')
Example:

        SELECT GROUP_CONCAT(name SEPARATOR ', ') AS student_names FROM students;

### Usage with `GROUP BY`
These aggregate functions are commonly used with the `GROUP BY` clause to group results based on one or more columns and perform calculations on each group.

Example (COUNT with GROUP BY):

        SELECT class_id, COUNT(*) AS num_students
        FROM students
        GROUP BY class_id;
