{{ config(
    materialized='table'
) }}

with customers as (
    select * from {{ ref('stg_customer') }}
),
customer_orders as (
    select * from {{ ref('int_customer_orders') }}
)

select
    c.customer_id,
    c.full_name,
    c.email,
    c.join_date,
    count(co.order_id) as total_orders,
    sum(co.order_total) as lifetime_value,
    min(co.order_date) as first_order_date,
    max(co.order_date) as last_order_date
from customers c
left join customer_orders co on c.customer_id = co.customer_id
group by 1,2,3,4