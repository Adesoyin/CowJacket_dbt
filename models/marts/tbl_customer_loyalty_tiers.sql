WITH CTE AS (
    SELECT * from {{ ref('int_customerloyalty_points') }}
),	

tiergroup AS (
    SELECT CTE.*, 
    CASE WHEN tier_total_points >= 500 THEN 'Gold'
        WHEN tier_total_points >= 100 AND tier_total_points < 500 THEN 'Silver'
        ELSE 'Bronze' 
    END AS tier
    FROM CTE
    ),

tiercount AS (
    SELECT customer_id, 
        count(distinct loyalty_id) tier_count
    FROM {{ ref('stg_loyalty_points') }}
    GROUP BY customer_id
),
tiers AS (
    SELECT a.*, tier_count
    FROM tiergroup a
    LEFT JOIN tiercount
    ON a.customer_id = tiercount.customer_id
)

SELECT customer_id, full_name,tier, tier_count, tier_total_points
FROM tiers
ORDER BY 1