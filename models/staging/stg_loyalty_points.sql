{{ config(
    materialized='ephemeral'
) }}

select loyalty_id, 
customer_id, 
points_earned, 
transaction_date, 
source
from {{ source ('dec_raw', 'loyalty_points') }}