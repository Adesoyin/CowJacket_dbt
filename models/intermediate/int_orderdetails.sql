SELECT a.order_item_id, 
        a.order_id, 
        a.product_id, 
        a.quantity, 
        a.line_total,
        b.product_name, 
        b.category, 
        b.price, 
        c.order_date, 
        c.customer_id, 
        d.full_name,
        c.total_amount 
from {{ ref('stg_order_items') }} a
left join {{ ref('stg_products') }} b
ON a.product_id = b.product_id
left join {{ ref('stg_orders') }} c
ON a.order_id = c.order_id
left join {{ ref('stg_customer') }} as d
on c.customer_id = d.customer_id