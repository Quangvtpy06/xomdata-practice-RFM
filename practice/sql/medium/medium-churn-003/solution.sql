-- Xom Data · Đồng hồ đếm ngược trước khi mất khách
-- Problem: https://xomdata.com/practice/medium-churn-003
-- Solved: 2026-09-13

with silent as(
    select customer_id, order_date,
        cast(julianday('2024-06-30') - julianday(max(order_date)) as integer) as days_silent 
    from orders
    group by customer_id
)
select customer_id, days_silent, (90-days_silent) as days_left
from silent
where days_silent <= 90
order by days_left, customer_id
