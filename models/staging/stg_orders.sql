
select 
order_id, 
customer_id, 
order_date, 
total_amount,
--CURRENT_TIMESTAMP() as etl_loaded_at
{{ dbt.dateadd(datepart='hour', interval=-3, from_date_or_timestamp='current_timestamp()') }} as etl_loaded_at
from {{ source ('dec_raw', 'orders') }}