
select customer_id, 
full_name, 
email, 
join_date,
etl_loaded_at
from {{ source ('dec_raw', 'customers') }}