WITH table1 AS (
    SELECT pid
    FROM Insurance
    GROUP BY lat,lon
    HAVING COUNT(*) = 1
)

SELECT ROUND(SUM(b.tiv_2016),2) AS tiv_2016
FROM table1 AS a, Insurance AS b
WHERE a.pid = b.pid AND (
    SELECT COUNT(*)
    FROM Insurance AS c
    WHERE b.tiv_2015 = c.tiv_2015
) > 1


------------------------------------------------------------

SELECT ROUND(SUM(b.tiv_2016),2) AS tiv_2016
FROM (
        SELECT pid
        FROM Insurance
        GROUP BY lat,lon
        HAVING COUNT(*) = 1
    ) AS a, Insurance AS b
WHERE a.pid = b.pid AND (
    SELECT COUNT(*)
    FROM Insurance AS c
    WHERE b.tiv_2015 = c.tiv_2015
) > 1
