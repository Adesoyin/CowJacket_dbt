
with customers as (
    select * from {{ ref('int_customers') }}
),

customer_orders as (
    select
        o.customer_id,
        o.order_id,
        o.order_date
    from {{ ref('stg_orders') }} o
)

select
    c.*,
    min(co.order_date) as first_order_date,
    max(co.order_date) as last_order_date,
from customers c
left join customer_orders co on c.customer_id = co.customer_id
group by 1,2,3,4,5,6
order by 1