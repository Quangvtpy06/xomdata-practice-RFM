-- Xom Data · Nhịp khách ghé cửa hàng theo tháng
-- Problem: https://xomdata.com/practice/medium-active-001
-- Solved: 2026-08-26

with month_order as (
    select DISTINCT (customer_id) customer_id, strftime('%Y-%m', order_date) as month 
    from orders
)
select month, count(customer_id) as active_customers
from month_order
GROUP BY month
order by month
