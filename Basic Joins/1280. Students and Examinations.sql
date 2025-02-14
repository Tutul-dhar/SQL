WITH table1 AS (
    select student_id, subject_name, COUNT(*) as cnt
    FROM Examinations
    GROUP BY student_id,subject_name
)
SELECT s.student_id,s.student_name,sub.subject_name,
        COALESCE(t1.cnt, 0) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects AS sub
LEFT JOIN table1 AS t1
    ON t1.student_id = s.student_id AND t1.subject_name = sub.subject_name
ORDER BY s.student_id ASC, sub.subject_name ASC
