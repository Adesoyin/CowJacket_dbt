{{ config(
    materialized='ephemeral'
) }}

select
    product_id,
    product_name,
    category,
    price
from {{ source ('dec_raw', 'products') }}