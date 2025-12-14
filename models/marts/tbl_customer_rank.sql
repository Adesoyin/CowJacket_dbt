with cte as (
    select *
    from
    {{ ref('int_orderdetails') }}
),

ordercount AS ( SELECT customer_id,full_name, 
    SUM(line_tOtal) AS total_revenue, 
    count(distinct order_item_id) ordercount
    FROM cte
    GROUP BY customer_id,full_name
)

SELECT customer_id,full_name,total_revenue, 
        CONCAT ('Rank ' , DENSE_RANK() OVER (ORDER BY total_revenue DESC)) spend_rank
        FROM ordercount