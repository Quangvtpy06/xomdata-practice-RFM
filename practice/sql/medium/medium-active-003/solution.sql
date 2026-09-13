-- Xom Data · Tháng bùng nổ khách mới
-- Problem: https://xomdata.com/practice/medium-active-003
-- Solved: 2026-09-13

with cte as(
    select customer_id, min(order_date) as first_date
    from orders
    GROUP BY customer_id
)
select strftime('%Y-%m',first_date) as month,
    count(customer_id) as new_customers
from cte
GROUP BY strftime('%Y-%m',first_date)
order by strftime('%Y-%m',first_date)
limit 1;
