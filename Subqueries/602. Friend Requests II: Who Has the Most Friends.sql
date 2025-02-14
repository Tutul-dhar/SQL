WITH table1 AS (
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
)

SELECT id, COUNT(*) AS num
FROM table1
GROUP BY id
ORDER BY num DESC
LIMIT 1

-----------------------------------------------

SELECT a.id, COUNT(*) AS num
FROM (
        SELECT requester_id AS id
        FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id
        FROM RequestAccepted
    ) AS a
GROUP BY a.id
ORDER BY num DESC
LIMIT 1
