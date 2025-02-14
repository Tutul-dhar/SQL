SELECT c.customer_id
FROM Customer AS c, Product AS p
GROUP BY c.customer_id
HAVING COUNT(DISTINCT(c.product_key)) = COUNT(DISTINCT(p.product_key))
