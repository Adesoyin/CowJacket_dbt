with cte as (

        select 
            order_date,
            year1 as order_year,
            month1 as order_monthnumber,
            monthname as order_month,
            day1 as order_daynumber,
            weekday1 as order_day,
            week1 as order_week_number,
            cast((year1 *100 + month1) as int) as order_year_month_sort

        from {{ ref('int_date') }}

)

select order_date,
        order_year,
        order_monthnumber,
        order_month,
        order_daynumber,
        order_day,
        order_week_number
from cte
order by order_year_month_sort