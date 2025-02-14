SELECT MAX(e.num) AS num
FROM (
    SELECT e1.num AS num
    FROM MyNumbers AS e1
    GROUP BY e1.num
    HAVING COUNT(*) = 1
) AS e
