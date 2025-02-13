WITH newTable AS (
    SELECT v.customer_id,t.transaction_id
    FROM Visits v
    LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
),
newOne AS (
    SELECT customer_id
    FROM newTable 
    WHERE transaction_id IS NULL
)

SELECT customer_id,COUNT(*) AS count_no_trans
FROM newOne
GROUP BY customer_id
