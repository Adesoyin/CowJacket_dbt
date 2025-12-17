
WITH CTE AS (
	    SELECT tier, count(distinct customer_id) customer_count
	    FROM {{ ref('tbl_customer_loyalty_tiers') }}
        group by tier
	    )

SELECT *
FROM cte