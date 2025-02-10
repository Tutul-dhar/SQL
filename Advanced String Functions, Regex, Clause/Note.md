## NOTE

- UPPER() / LOWER() → Convert text to uppercase/lowercase
  
        SELECT UPPER('hello'), LOWER('WORLD');

- LENGTH() → Get string length
    
        SELECT LENGTH('SQL Learning');

- SUBSTRING() / LEFT() / RIGHT() → Extract part of a string
  
        SELECT SUBSTRING('Database', 2, 3); -- Outputs 'ata'
        SELECT LEFT('Hello', 2); -- 'He'
        SELECT RIGHT('Hello', 2); -- 'lo'

- REPLACE() → Replace text
  
        SELECT REPLACE('I love SQL', 'SQL', 'Databases'); -- 'I love Databases'

- TRIM() / LTRIM() / RTRIM() → Remove spaces
  
        SELECT TRIM('  SQL  '); -- 'SQL'
        SELECT LTRIM('  SQL'); -- 'SQL'
        SELECT RTRIM('SQL  '); -- 'SQL'

- Find names starting with 'A'
  
        SELECT * FROM users WHERE name REGEXP '^A';

- Find emails ending with .com
  
        SELECT * FROM users WHERE email REGEXP '.com$';

- Find strings with digits
  
        SELECT * FROM products WHERE name REGEXP '[0-9]';

- Using CONCAT() (Recommended)
  
        SELECT CONCAT('Hello', ' ', 'World'); -- Output: 'Hello World'

- Matching words that start with a specific prefix:
  
        SELECT * FROM table_name 
        WHERE column_name REGEXP '\\bDIAB1';

- In MySQL, you can use GROUP_CONCAT() to combine multiple column values into a single row 
  when using GROUP BY. This is useful for aggregating values into a new column.

  i) First example ... 

        SELECT department, GROUP_CONCAT(employee_name) AS employees
        FROM employees
        GROUP BY department;

  ii) Second example... (Custom Separator (Use something other than ,))

        SELECT department, GROUP_CONCAT(employee_name SEPARATOR ' | ') AS employees
        FROM employees
        GROUP BY department;

    iii) Third example... (Using ORDER BY inside GROUP_CONCAT()) 

        SELECT department, GROUP_CONCAT(employee_name ORDER BY employee_name ASC SEPARATOR ', ') AS employees
        FROM employees
        GROUP BY department;

- We can check if a string starts with any lowercase (a-z) or uppercase (A-Z) letter using REGEXP

        SELECT * 
        FROM table_name 
        WHERE column_name REGEXP '^[a-zA-Z]';

