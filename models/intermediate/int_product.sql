select 
    product_id,
    product_name,
    CASE
        WHEN product_name = 'Wireless Mouse' THEN 'Computer Accessories'
        WHEN product_name = 'Bluetooth Speaker' THEN 'Audio & Sound'
        WHEN product_name = 'Smart Lamp' THEN 'Smart Home Devices'
        WHEN product_name = 'Cookware Set' THEN 'Kitchenware & Dining'
        WHEN product_name = 'Formal Shirt' THEN 'Men Apparel'
        WHEN product_name = 'Sneakers' THEN 'Footwear'
        WHEN product_name = 'Green Tea' THEN 'Beverages & Drinks'
        WHEN product_name = 'Phone Case' THEN 'Mobile Accessories'
        WHEN product_name = 'Backpack' THEN 'Bags & Luggage'
        WHEN product_name = 'LED TV 32\"' THEN 'Televisions & Video'
        WHEN product_name = 'Hair Dryer' THEN 'Hair Care Appliances'
        WHEN product_name = 'Coffee Maker' THEN 'Kitchen Appliances'
        WHEN product_name = 'Rice Cooker' THEN 'Kitchen Appliances'
        WHEN product_name = 'Sunglasses' THEN 'Accessories'
        WHEN product_name = 'T-shirt' THEN 'Men Apparel'
        WHEN product_name = 'Running Shorts' THEN 'Men Apparel'
        WHEN product_name = 'Water Bottle' THEN 'Dining & Hydration'
        WHEN product_name = 'Gaming Keyboard' THEN 'Computer Accessories'
        WHEN product_name = 'External HDD' THEN 'Data Storage'
        WHEN product_name = 'Powerbank' THEN 'Mobile Accessories'
        ELSE 'Uncategorized' -- Default case for any new products
    END AS "SUB_CATEGORY",
    category as product_category,
    price,
    TO_VARCHAR(CURRENT_TIMESTAMP(), 'YYYY-MM-DD HH24:MI:SS') as etl_loaded_at
from
{{ ref('stg_products') }}