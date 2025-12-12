
select order_item_id, 
order_id, 
product_id, 
quantity, 
line_total,
etl_loaded_at
from {{ source ('dec_raw', 'order_items') }}