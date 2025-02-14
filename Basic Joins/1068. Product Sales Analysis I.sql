SELECT p.product_name,s.year, s.price
FROM Sales AS s
JOIN Product AS p
WHERE s.product_id = p.product_id
