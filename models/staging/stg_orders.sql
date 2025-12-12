
select 
order_id, 
customer_id, 
order_date, 
total_amount,
etl_loaded_at
from {{ source ('dec_raw', 'orders') }}