WITH first_table AS (
    SELECT player_id,MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
    
), second_table AS (
    SELECT COUNT(a1.player_id) AS cnt
    FROM first_table AS a1
    JOIN Activity AS a2
    WHERE a1.player_id = a2.player_id AND a2.event_date = DATE_ADD(a1.event_date,INTERVAL 1 DAY)
),third_table AS (
    SELECT COUNT(DISTINCT(player_id)) AS cnt
    FROM Activity
)

-- select *
-- from second_table

SELECT ROUND(a1.cnt/a2.cnt, 2) AS fraction
FROM second_table AS a1, third_table AS a2
