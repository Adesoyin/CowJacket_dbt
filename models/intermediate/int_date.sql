
select distinct order_date, 
    CAST(EXTRACT(YEAR FROM order_date) AS VARCHAR) AS year1, 
    EXTRACT(MONTH FROM order_date) AS month1,              
    TO_VARCHAR(order_date, 'MMMM') AS MonthName,            
    EXTRACT(DAY FROM order_date) AS day1,               
    DAYNAME(order_date) AS weekday1,                   
    EXTRACT(WEEK FROM order_date) AS week1              
from {{ ref('stg_orders') }}