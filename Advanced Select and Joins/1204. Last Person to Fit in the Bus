SELECT a.person_name
FROM Queue AS a
JOIN Queue AS b
ON b.turn <= a.turn
GROUP BY a.turn
HAVING SUM(b.weight) <= 1000
ORDER BY SUM(b.weight) DESC
LIMIT 1
