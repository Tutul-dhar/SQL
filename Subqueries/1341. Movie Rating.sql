WITH table1 AS (
    SELECT user_id
    FROM MovieRating
    GROUP BY user_id
    HAVING COUNT(user_id) = (
        SELECT MAX(a.cnt)
        FROM (
            SELECT COUNT(b.user_id) AS cnt
            FROM MovieRating AS b
            GROUP BY b.user_id
        ) AS a
    )
),
table2 AS (
    SELECT movie_id
    FROM MovieRating
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY movie_id
    HAVING ABS(AVG(rating) - (
        SELECT MAX(avg_rating)
        FROM (
            SELECT AVG(rating) AS avg_rating
            FROM MovieRating
            WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
            GROUP BY movie_id
        ) AS a
    )) < 0.0001 
)
SELECT MIN(a.name) AS results
FROM Users AS a
JOIN table1 AS b
WHERE a.user_id = b.user_id

UNION ALL

SELECT MIN(a.title) AS results
FROM Movies AS a
JOIN table2 AS b
WHERE a.movie_id = b.movie_id
