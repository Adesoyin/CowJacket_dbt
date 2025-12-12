{{ config(
    materialized='ephemeral'
) }}

select 
order_id, 
customer_id, 
order_date, 
total_amount
from {{ source ('dec_raw', 'orders') }}