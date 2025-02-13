WITH table1 AS (
    SELECT a.product_id, a.new_price AS price
    FROM Products AS a
    JOIN (
        SELECT c.product_id,MAX(c.change_date) AS change_date
        FROM Products AS c
        where c.change_date <= '2019-08-16'
        GROUP BY c.product_id
        
    ) AS b
    WHERE a.product_id = b.product_id AND a.change_date = b.change_date
),
table2 AS (
    SELECT product_id, 10 AS price
    FROM Products
    WHERE product_id NOT IN (
        SELECT product_id
        FROM table1
    )
)

SELECT product_id, price
FROM table1
UNION
SELECT product_id, price
FROM table2
