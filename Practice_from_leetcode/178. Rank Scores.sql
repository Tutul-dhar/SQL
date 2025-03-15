SELECT a.score AS score, (SELECT COUNT(DISTINCT(b.score)) 
                            FROM Scores AS b
                            WHERE a.score < b.score    
                        ) + 1 AS `rank`
FROM (SELECT score
     FROM Scores
     ORDER BY score DESC
     ) AS a


----------------------------------------------------------------

SELECT a.score AS score, (SELECT COUNT(DISTINCT(b.score)) 
                            FROM Scores AS b
                            WHERE a.score < b.score    
                        ) + 1 AS `rank`
FROM Scores AS a
ORDER BY score DESC
