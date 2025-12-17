{{ config(
    materialized = 'table',
    enabled = (target.name == 'staging'),
    database = 'ADEFACTORY_PROD',
    schema = 'DBT_PROD_MART'
) }}


-- ONLY STAGING CAN PASS
select
    o.order_id,
    o.order_date,
    oi.order_item_id,
    oi.quantity,
    c.customer_id,
    p.product_id,
    p.price,
    lp.loyalty_id,
    lp.points_earned,
    lp.transaction_date,
    lp.source

-- joining all tables
from {{ ref('stg_orders') }} o
left join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id
left join {{ ref('stg_customer') }} c
    on o.customer_id = c.customer_id
left join {{ ref('stg_products') }} p
    on oi.product_id = p.product_id
left join {{ ref('stg_loyalty_points') }} lp
    on c.customer_id = lp.customer_id
