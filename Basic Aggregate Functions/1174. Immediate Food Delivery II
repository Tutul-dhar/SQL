WITH min_date AS (
    SELECT customer_id,MIN(order_date) AS min_order_date,
    MIN(customer_pref_delivery_date) AS min_customer_pref_delivery_date
    FROM Delivery
    GROUP BY customer_id
)


SELECT ROUND((SUM(CASE WHEN min_order_date = min_customer_pref_delivery_date THEN 1 END)/COUNT(customer_id))*100.0,2) AS immediate_percentage
FROM min_date
