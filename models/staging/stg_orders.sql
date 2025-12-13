
select 
order_id, 
customer_id, 
order_date, 
total_amount,
CURRENT_TIMESTAMP() as etl_loaded_at
from {{ source ('dec_raw', 'orders') }}