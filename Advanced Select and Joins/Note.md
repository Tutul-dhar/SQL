
## NOTE

### 🔹 Advanced SELECT Queries

The SELECT statement is the foundation of SQL queries, and there are advanced techniques to enhance its functionality.

### 1️⃣ Selecting Specific Columns

Instead of `SELECT *`, always select only the columns we need.

        SELECT name, age FROM students;

### 2️⃣ Using DISTINCT to Remove Duplicates
The `DISTINCT` keyword removes duplicate values from the results.

        SELECT DISTINCT grade FROM students;
This will return a list of unique grades.

### 3️⃣ Using `WHERE` to Filter Results

        SELECT * FROM students WHERE age > 21;
This returns only students older than 21.

### 4️⃣ Using `LIKE` for Pattern Matching

        SELECT * FROM students WHERE name LIKE 'A%';
- `%` means any sequence of characters.
- `_` means a single character.

Example:

- `'A%'` → Names that start with 'A'
- `'%e'` → Names that end with 'e'
- `'_a%'` → Names where the second letter is 'a'

### 5️⃣ Using `IN` for Multiple Values
Instead of multiple OR conditions, use `IN`.

        SELECT * FROM students WHERE grade IN ('A', 'B');

### 6️⃣ Using `CASE` for Conditional Values
The `CASE` statement is like an `if-else` statement.

        SELECT name, age,
        CASE 
                WHEN age < 21 THEN 'Young'
                WHEN age BETWEEN 21 AND 22 THEN 'Adult'
                ELSE 'Senior'
        END AS category
        FROM students;
This categorizes students based on their age.

### 7️⃣ `BETWEEN` (Range Filter)
The `BETWEEN` operator filters values within a specified range, `including` the boundary values.

Syntax:

        SELECT column1 FROM table_name  
        WHERE column1 BETWEEN value1 AND value2;
Example:

Find students between the ages of 7 and 23.

        SELECT name, age FROM students  
        WHERE age BETWEEN 7 AND 23;

### 8️⃣ `UNION` & `UNION ALL` (Combining Results from Multiple Queries)

Both `UNION` and `UNION ALL` combine results of two `SELECT` queries.

### 🔸 `UNION` (Removes Duplicates)

- Combines results and removes duplicate rows.

        SELECT name FROM students  
        UNION  
        SELECT name FROM alumni;
✅ If the same name appears in both tables, it appears only once in the result.

### 🔸 `UNION ALL` (Keeps Duplicates)

- Combines results and keeps duplicate rows.

        SELECT name FROM students  
        UNION ALL  
        SELECT name FROM alumni;

✅ If a name appears in both tables, it appears twice in the result.

⚠️ Note:

- The columns in both SELECT queries must have the same data type.
- The column names in the output follow the first SELECT statement.

### 9️⃣ `LIMIT` (Restricting the Number of Results)

The `LIMIT` clause restricts the number of rows returned.

Example:

Get the top 5 youngest students.

        SELECT name, age FROM students  
        ORDER BY age ASC  
        LIMIT 5;
✅ Returns only 5 rows.

### 🔸 Pagination with `LIMIT` & `OFFSET`
- If we want next pages of results, use `OFFSET`:

        SELECT name FROM students  
        ORDER BY name ASC  
        LIMIT 5 OFFSET 5;
✅ This skips the first 5 rows and returns the next 5.

### 1️⃣0️⃣ `IS NULL` (Checking for Missing Values)

In SQL, `NULL` represents missing or unknown values. We cannot use `=` to check for `NULL`.

### 🔸 Checking `NULL` values

        SELECT name FROM students  
        WHERE department_id IS NULL;
✅ Returns students who don’t have a department assigned.

### 🔸 Checking `NOT NULL` values

        SELECT name FROM students  
        WHERE department_id IS NOT NULL;
✅ Returns students who are assigned to a department.

### 1️⃣1️⃣ Using `IF()` Function

The `IF()` function works like a simple ternary operator

🔸 Syntax

        IF(condition, value_if_true, value_if_false)
🔸 Example

Check if a student has passed (score >= 50) or failed.

        SELECT name, score,  
        IF(score >= 50, 'Pass', 'Fail') AS result  
        FROM students;
✅ If score >= 50, it returns "Pass", otherwise "Fail".
