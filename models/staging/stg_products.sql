
select
    product_id,
    product_name,
    category,
    price,
    etl_loaded_at
from {{ source ('dec_raw', 'products') }}