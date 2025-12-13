
with customers as (
    select * from {{ ref('stg_customer') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),
customer_orders as (
    select
        o.customer_id,
        o.order_id,
        o.order_date,
        sum(oi.line_total) as order_total,
        count(oi.order_item_id) as item_count
    from orders o
    left join order_items oi on o.order_id = oi.order_id
    group by 1,2,3
)

select
    c.customer_id,
    c.full_name,
    c.email,
    c.join_date,
    count(co.order_id) as total_orders,
    sum(co.order_total) as lifetime_value
from customers c
left join customer_orders co on c.customer_id = co.customer_id
group by 1,2,3,4
order by 1