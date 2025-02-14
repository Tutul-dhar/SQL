WITH startTime AS (
    SELECT machine_id, process_id, timestamp
    FROM Activity
    WHERE activity_type = 'start'
),
endTime AS (
    SELECT machine_id, process_id, timestamp
    FROM Activity
    WHERE activity_type = 'end'
),
newTable AS (
    SELECT 
        s.machine_id, 
        e.timestamp - s.timestamp AS diff
    FROM startTime s
    JOIN endTime e
    ON s.machine_id = e.machine_id AND s.process_id = e.process_id
),
avgTable AS (
    SELECT machine_id,round(avg(diff),3) AS processing_time
    FROM newTable
    GROUP BY machine_id
)
SELECT *
FROM avgTable
