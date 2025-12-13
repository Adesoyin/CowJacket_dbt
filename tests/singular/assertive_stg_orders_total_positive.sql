select
    order_id,
    sum(total_amount) total_amount
from {{ ref('stg_orders') }}
group by 1
having sum(total_amount) < 0 