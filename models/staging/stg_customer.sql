
select customer_id, 
full_name, 
email, 
join_date,
CURRENT_TIMESTAMP() as etl_loaded_at
from {{ source ('dec_raw', 'customers') }}