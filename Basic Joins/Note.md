
## NOTE

### Basic JOINs in MySQL

### 1. INNER JOIN

- Returns only the matching rows from both tables.
- Used when: We need only related data from both tables.

        SELECT students.name, classes.class_name
        FROM students
        INNER JOIN classes ON students.class_id = classes.class_id;

### 2. LEFT JOIN
- Returns all rows from the left table and matching rows from the right table (NULL if no match).
- Used when: We want all records from the left table, even if there's no match in the right table.

        SELECT students.name, classes.class_name
        FROM students
        LEFT JOIN classes ON students.class_id = classes.class_id;

### 3. RIGHT JOIN
- Returns all rows from the right table and matching rows from the left table (NULL if no match).
- Used when: We want all records from the right table, even if there's no match in the left table.

        SELECT students.name, classes.class_name
        FROM students
        RIGHT JOIN classes ON students.class_id = classes.class_id;

### 4. FULL JOIN (Not directly supported in MySQL)
- Returns all rows from both tables (NULL for unmatched rows).
- Used when: We need all data from both tables, even if no match exists.

        SELECT students.name, classes.class_name
        FROM students
        LEFT JOIN classes ON students.class_id = classes.class_id
        UNION
        SELECT students.name, classes.class_name
        FROM students
        RIGHT JOIN classes ON students.class_id = classes.class_id;

### WITH Clause in MySQL (Common Table Expressions - CTEs)

The WITH clause is used to define Common Table Expressions (CTEs), which are temporary result sets that exist only for the duration of a query.

Why Use WITH?

- Improves readability and organization of complex queries.
- Avoids redundant subqueries.
- Useful for recursive queries.

Basic Syntax:

        WITH cte_name AS (
                SELECT column1, column2 
                FROM table_name 
                WHERE condition
        )
        SELECT * FROM cte_name;

### COALESCE Function in MySQL
The `COALESCE()` function is used to return the first non-NULL value in a list of arguments. It is helpful when you want to replace `NULL` with a default value or find the first available value in a series of expressions.

Syntax:

        COALESCE(value1, value2, value3, ..., valueN)

- Returns the first non-NULL value from the list.
- If all values are NULL, it returns NULL.

### When to Use `COALESCE()`

- Handling NULL values: Replace NULL with a default value or a more meaningful alternative.

- Simplifying complex conditions: Instead of writing multiple `CASE` statements or `IFNULL`, `COALESCE()` simplifies the query.

Example of Replacing NULL with a Default Value:

        SELECT name, COALESCE(phone_number, 'No phone number provided') AS contact_info
        FROM employees;
This will return `'No phone number provided'` for any employee without a phone number.




