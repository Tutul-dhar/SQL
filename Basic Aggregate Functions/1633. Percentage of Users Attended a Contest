SELECT 
    r.contest_id,
    ROUND((COUNT(r.contest_id) / (SELECT COUNT(*) FROM Users)) * 100, 2) AS percentage
FROM 
    Register AS r
LEFT JOIN 
    Users AS u
ON 
    r.user_id = u.user_id
GROUP BY 
    r.contest_id
ORDER BY 
    percentage DESC, -- Primary sorting by percentage (descending)
    r.contest_id ASC; -- Secondary sorting by contest_id (ascending)
