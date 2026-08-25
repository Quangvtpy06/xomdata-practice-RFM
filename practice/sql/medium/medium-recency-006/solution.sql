-- Xom Data · Hồ sơ ba chỉ số thô của từng khách
-- Problem: https://xomdata.com/practice/medium-recency-006
-- Solved: 2026-08-25

with silents as (
    select customer_id, order_id, amount,
    (strftime('%s', '2024-06-30') - strftime('%s',order_date)) / (60*60*24) as days
    from orders
)
select customer_id, min(days) as days_silent, count(order_id) as order_count, sum(amount) as total_spent
from silents
group by customer_id
order by customer_id
