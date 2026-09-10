-- Xom Data · Mỗi thế hệ khách đông cỡ nào
-- Problem: https://xomdata.com/practice/medium-cohort-004
-- Solved: 2026-09-10

with first_order as (
select min(order_date) as first_order_month,
    customer_id
from orders
group by customer_id
)
select strftime('%Y-%m',first_order_month) as cohort_month, count(customer_id) as cohort_size
from first_order
GROUP BY strftime('%Y-%m',first_order_month)
order by cohort_month
