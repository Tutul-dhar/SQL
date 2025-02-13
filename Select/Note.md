
## NOTE

### 1. SELECT Statement

The SELECT statement is used to retrieve data from one or more tables.

Basic Syntax:

        SELECT column1, column2 FROM table_name;

        SELECT * FROM table_name; → Retrieves all columns.

        SELECT column_name FROM table_name; → Retrieves specific columns.

        SELECT DISTINCT column_name FROM table_name; → Retrieves unique values.

        SELECT column1, column2 FROM table_name WHERE condition; → Filters results based on a condition.

### 2. Filtering with WHERE Clause

        WHERE column_name = value → Filters rows based on a condition.

        WHERE column_name != value → Excludes rows with a specific value.

        WHERE column_name IS NULL → Checks for NULL values.

        WHERE column_name IS NOT NULL → Excludes NULL values.

### 3. Logical Operators

        AND → Combines multiple conditions (both must be true).

        OR → Combines conditions (at least one must be true).

### 4. DISTINCT Clause

        SELECT DISTINCT column_name → Retrieves unique values from a column.

### 5. Ordering Results

        ORDER BY column_name → Sorts results in ascending order (default).

        ORDER BY column_name DESC → Sorts results in descending order.

### 6. String Functions

        LENGTH(column_name) → Returns the length of a string.

### 7. Comparison Operators

        >= → Greater than or equal to.

        <= → Less than or equal to.

### 8. Querying Specific Columns

        SELECT column1, column2 FROM table_name → Retrieves specific columns instead of all (SELECT *).

9. Filtering Numeric Data

        WHERE column_name >= value → Filters rows where the column's value is greater than or equal to a given number.

   ### COUNT() Function in MySQL

The `COUNT()` function is used to count the number of rows that match a specified condition or to count non-NULL values in a column.

Syntax:

### 1. Count All Rows:

        COUNT(*)
- Returns the total number of rows in the table or group.

### 2. Count Non-NULL Values:

        COUNT(column_name)
- Returns the number of non-NULL values in the specified column.

### 3. COUNT with GROUP BY: We can also use COUNT() with GROUP BY to count occurrences of different values in a column.

        SELECT class_id, COUNT(*) AS num_students
        FROM students
        GROUP BY class_id;
### When to Use COUNT():

- Counting Total Rows: To count the total number of records in a table.
- Counting Specific Data: To count how many rows meet a specific condition or have non-NULL values.
- Grouped Counts: To count occurrences of data in groups (using `GROUP BY`).

## SQL Date and Time Operations
### 1️ Date Arithmetic (Addition & Subtraction)
📌 Add or Subtract Days, Months, or Years

        SELECT DATE_ADD('2024-02-12', INTERVAL 5 DAY);  -- Adds 5 days
        SELECT DATE_SUB('2024-02-12', INTERVAL 2 MONTH);  -- Subtracts 2 months
        SELECT DATE_ADD('2024-02-12', INTERVAL 1 YEAR);  -- Adds 1 year

### 2️⃣ Date Difference (Finding Intervals)
📌 Find Difference Between Two Dates

        SELECT DATEDIFF('2024-03-01', '2024-02-12');  -- 18 (days)
        SELECT TIMESTAMPDIFF(MONTH, '2023-02-12', '2024-02-12');  -- 12 (months)
        SELECT TIMESTAMPDIFF(YEAR, '2020-02-12', '2024-02-12');  -- 4 (years)

### 3️⃣ Extracting Date Parts
📌 Get Year, Month, Day, Hour, Minute, Second

        SELECT YEAR('2024-02-12');   -- 2024
        SELECT MONTH('2024-02-12');  -- 2
        SELECT DAY('2024-02-12');    -- 12
        SELECT HOUR('2024-02-12 14:30:00');   -- 14
        SELECT MINUTE('2024-02-12 14:30:00'); -- 30
        SELECT SECOND('2024-02-12 14:30:25'); -- 25

### 4️⃣ Formatting Dates
📌 Convert Date to Custom Format

        SELECT DATE_FORMAT('2024-02-12', '%Y-%m-%d');  -- 2024-02-12
        SELECT DATE_FORMAT('2024-02-12', '%d-%m-%Y');  -- 12-02-2024

### 5️⃣ Current Date and Time
📌 Get Current Date, Time, and Datetime

        SELECT CURDATE();  -- 2024-02-12 (only date)
        SELECT CURRENT_DATE();  -- 2024-02-12 (same as CURDATE())

        SELECT CURTIME();  -- 14:30:00 (only time)
        SELECT CURRENT_TIME();  -- 14:30:00 (same as CURTIME())

        SELECT NOW();  -- 2024-02-12 14:30:00 (date + time)
        SELECT CURRENT_TIMESTAMP();  -- 2024-02-12 14:30:00 (same as NOW())

### 6️⃣ Working with Week, Quarter, and Day of Year
📌 Get Day of Week, Week Number, Quarter

        SELECT DAYOFWEEK('2024-02-12');  -- 2 (Monday, where Sunday = 1)
        SELECT WEEK('2024-02-12');  -- 7 (7th week of the year)
        SELECT QUARTER('2024-02-12');  -- 1 (1st quarter)
        SELECT DAYOFYEAR('2024-02-12');  -- 43 (43rd day of the year)

### 7️⃣ Getting the First & Last Day of Month
📌 Find First and Last Day of a Month

        SELECT LAST_DAY('2024-02-12');  -- 2024-02-29 (last day of Feb)
        SELECT DATE_FORMAT('2024-02-12', '%Y-%m-01');  -- 2024-02-01 (first day)

### 8️⃣ Finding the Next or Previous Specific Day
📌 Get the Next Monday After a Date

        SELECT DATE_ADD('2024-02-12', INTERVAL (9 - DAYOFWEEK('2024-02-12')) % 7 DAY);

### 9️⃣ Date Comparison
📌 Compare Dates

        SELECT '2024-02-12' > '2024-01-01';  -- 1 (TRUE)
        SELECT '2024-02-12' = '2024-02-12';  -- 1 (TRUE)
        SELECT '2024-02-12' < '2024-02-20';  -- 1 (TRUE)

### 🔟 Using Date in Filtering
📌 Find Data in the Last 7 Days

        SELECT * FROM Customer 
        WHERE visited_on >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

