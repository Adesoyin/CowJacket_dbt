
select distinct order_date, 
    CAST(EXTRACT(YEAR FROM order_date) AS VARCHAR) AS year1, 
    EXTRACT(MONTH FROM order_date) AS month1,               -- Returns month number as a number
    TO_VARCHAR(order_date, 'MMMM') AS MonthName,            -- 'MMMM' for full month name
    EXTRACT(DAY FROM order_date) AS day1,               -- Returns day number as a number
    DAYNAME(order_date) AS weekday1,                   -- 'Day' for weekday name
    EXTRACT(WEEK FROM order_date) AS week1              -- Extract the week number in the year
from {{ ref('stg_orders') }}