
select loyalty_id, 
customer_id, 
points_earned, 
transaction_date, 
source,
etl_loaded_at
from {{ source ('dec_raw', 'loyalty_points') }}