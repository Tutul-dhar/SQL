
## NOTE

1. SELECT Statement

The SELECT statement is used to retrieve data from one or more tables.

Basic Syntax:

        SELECT column1, column2 FROM table_name;

        SELECT * FROM table_name; → Retrieves all columns.

        SELECT column_name FROM table_name; → Retrieves specific columns.

        SELECT DISTINCT column_name FROM table_name; → Retrieves unique values.

        SELECT column1, column2 FROM table_name WHERE condition; → Filters results based on a condition.

2. Filtering with WHERE Clause

        WHERE column_name = value → Filters rows based on a condition.

        WHERE column_name != value → Excludes rows with a specific value.

        WHERE column_name IS NULL → Checks for NULL values.

        WHERE column_name IS NOT NULL → Excludes NULL values.

3. Logical Operators

        AND → Combines multiple conditions (both must be true).

        OR → Combines conditions (at least one must be true).

4. DISTINCT Clause

        SELECT DISTINCT column_name → Retrieves unique values from a column.

5. Ordering Results

        ORDER BY column_name → Sorts results in ascending order (default).

        ORDER BY column_name DESC → Sorts results in descending order.

6. String Functions

        LENGTH(column_name) → Returns the length of a string.

7. Comparison Operators

        >= → Greater than or equal to.

        <= → Less than or equal to.

8. Querying Specific Columns

        SELECT column1, column2 FROM table_name → Retrieves specific columns instead of all (SELECT *).

9. Filtering Numeric Data

        WHERE column_name >= value → Filters rows where the column's value is greater than or equal to a given number.

   ### COUNT() Function in MySQL

The `COUNT()` function is used to count the number of rows that match a specified condition or to count non-NULL values in a column.

Syntax:

1. Count All Rows:

        COUNT(*)
- Returns the total number of rows in the table or group.

2. Count Non-NULL Values:

        COUNT(column_name)
- Returns the number of non-NULL values in the specified column.

3. COUNT with GROUP BY: We can also use COUNT() with GROUP BY to count occurrences of different values in a column.

        SELECT class_id, COUNT(*) AS num_students
        FROM students
        GROUP BY class_id;
### When to Use COUNT():

- Counting Total Rows: To count the total number of records in a table.
- Counting Specific Data: To count how many rows meet a specific condition or have non-NULL values.
- Grouped Counts: To count occurrences of data in groups (using `GROUP BY`).
