SELECT e2.product_id, e2.year AS first_year, e2.quantity,e2.price
FROM (
    SELECT e3.product_id, MIN(e3.year) AS year
    FROM Sales AS e3
    GROUP BY e3.product_id
) AS e1
JOIN Sales AS e2
WHERE e1.product_id = e2.product_id AND e1.year = e2.year
