SELECT a.customer_id, a.full_name, 
    CASE WHEN SUM(points_earned) IS NULL THEN 0 ELSE SUM(points_earned)
    END AS tier_total_points
FROM {{ ref('stg_customer') }} a
--Left join ensures all customers are returned even if there is no loyalty points for them.
LEFT JOIN {{ ref('stg_loyalty_points') }} b
ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.full_name
ORDER BY 1