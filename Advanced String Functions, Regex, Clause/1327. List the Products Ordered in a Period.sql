Problem Link: https://leetcode.com/problems/list-the-products-ordered-in-a-period/?envType=study-plan-v2&envId=top-sql-50

SELECT a.product_name, b.unit
FROM Products AS a, (  
    SELECT product_id, SUM(unit) AS unit
    FROM Orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id) AS b
WHERE a.product_id = b.product_id AND b.unit >=100
