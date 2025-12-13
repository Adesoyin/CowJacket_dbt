
select
    product_id,
    product_name,
    category,
    price,
    CURRENT_TIMESTAMP() as etl_loaded_at
from {{ source ('dec_raw', 'products') }}