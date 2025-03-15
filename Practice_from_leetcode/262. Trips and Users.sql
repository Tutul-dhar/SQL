WITH client AS (
    SELECT users_id
    FROM Users
    WHERE banned = 'No' AND role = 'client'
), driver AS (
    SELECT users_id
    FROM Users
    WHERE banned = 'No' AND role = 'driver'
)

-- select users_id from driver

SELECT request_at AS `Day`,ROUND(COUNT(CASE 
            WHEN status != 'completed'  THEN 1
        END) / COUNT(*), 2) AS `Cancellation Rate`
FROM Trips
WHERE driver_id IN (SELECT users_id FROM driver) AND client_id  IN (SELECT users_id FROM client)
GROUP BY request_at
HAVING request_at BETWEEN '2013-10-01' AND '2013-10-03'
