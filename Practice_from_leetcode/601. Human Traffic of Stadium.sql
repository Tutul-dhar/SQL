WITH possible_id AS (
    SELECT id
    FROM Stadium
    WHERE people >= 100
)

SELECT id, visit_date, people
FROM Stadium
WHERE ((id IN (SELECT id FROM possible_id)) 
    AND ((id-1) IN (SELECT id FROM possible_id))
    AND ((id+1) IN (SELECT id FROM possible_id)))
    OR
    ((id IN (SELECT id FROM possible_id)) 
    AND ((id-1) IN (SELECT id FROM possible_id))
    AND ((id-2) IN (SELECT id FROM possible_id)))
    OR 
    ((id IN (SELECT id FROM possible_id)) 
    AND ((id+1) IN (SELECT id FROM possible_id))
    AND ((id+2) IN (SELECT id FROM possible_id)))
--------------------------------------------------------------

WITH table1 AS (
    SELECT id, visit_date, people
    FROM Stadium
    WHERE people >= 100
)

SELECT a.id, a.visit_date, a.people
FROM (
    SELECT id,visit_date,people,
        LAG(id,1) OVER (ORDER BY id) AS prev1,
        LAG(id,2) OVER (ORDER BY id) AS prev2,
        LEAD(id,1) OVER (ORDER BY id) AS next1,
        LEAD(id,2) OVER (ORDER BY id) AS next2
    FROM table1
) AS a
WHERE (a.id+1 = next1 AND a.id-1 = prev1)
    OR (a.id-1 = prev1 AND a.id-2 = prev2)
    OR (a.id+1 = next1 AND a.id+2 = next2)
