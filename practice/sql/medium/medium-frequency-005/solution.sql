-- Xom Data · Khách phủ sóng nhiều tháng nhất
-- Problem: https://xomdata.com/practice/medium-frequency-005
-- Solved: 2026-08-25

with active as (
    select customer_id, order_id, strftime('%Y-%m', order_date) as month_order
    from orders
    where order_id IS NOT NULL
)
select customer_id, count(DISTINCT month_order) as active_months, count(DISTINCT order_id) as total_orders
from active
group by customer_id
order by active_months desc, customer_id
