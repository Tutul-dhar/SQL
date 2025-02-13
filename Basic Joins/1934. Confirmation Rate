WITH confirmed AS (
    SELECT 
    u.user_id,
    COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) AS confirmed_count
    FROM 
        Signups u
    LEFT JOIN 
        Confirmations c
        ON u.user_id = c.user_id
    GROUP BY 
        u.user_id


), total AS (
    SELECT s.user_id, COUNT(*) AS total_count
    FROM Signups s
    LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
    GROUP BY s.user_id
)
SELECT 
    t.user_id,
    ROUND(CASE 
        WHEN t.total_count > 0 THEN c.confirmed_count / t.total_count
        ELSE 0
    END,2) AS confirmation_rate
FROM total t
JOIN confirmed c
ON t.user_id = c.user_id
