SELECT (CASE WHEN id%2 = 1 AND (SELECT COUNT(*) FROM Seat) = id THEN id
            WHEN id%2 = 1 THEN id+1
            ELSE id-1 END) AS id, student
FROM Seat
ORDER BY id
