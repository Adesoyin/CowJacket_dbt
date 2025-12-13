with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
)

select
    o.customer_id,
    o.order_id,
    o.order_date,
    sum(oi.line_total) as order_total,
    count(oi.order_item_id) as item_count
from orders o
left join order_items oi on o.order_id = oi.order_id
group by 1,2,3
order by 1