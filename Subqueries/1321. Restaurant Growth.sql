-- WITH possible_date AS (
--     SELECT DISTINCT(visited_on)
--     FROM Customer
--     WHERE visited_on >= 
--     (
--         SELECT DATE_ADD(MIN(visited_on),INTERVAL 6 DAY)
--         FROM Customer
--     )
--     ORDER BY visited_on
-- )
-- select * 
-- from possible_date

SELECT a.visited_on, SUM(amount) AS amount, ROUND(SUM(amount)/7,2) AS average_amount
FROM (
    SELECT DISTINCT(visited_on)
    FROM Customer
    WHERE visited_on >= 
    (
        SELECT DATE_ADD(MIN(visited_on),INTERVAL 6 DAY)
        FROM Customer
    )
    ORDER BY visited_on
) a,Customer b
WHERE b.visited_on BETWEEN (a.visited_on - INTERVAL 6 DAY) AND a.visited_on
GROUP BY a.visited_on
