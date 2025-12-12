{{ config(
    materialized='ephemeral'
) }}

select customer_id, 
full_name, 
email, 
join_date
from {{ source ('dec_raw', 'customers') }}