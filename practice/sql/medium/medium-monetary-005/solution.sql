-- Xom Data · Miếng bánh doanh thu của từng khách
-- Problem: https://xomdata.com/practice/medium-monetary-005
-- Solved: 2026-08-25

with customer as(
    select customer_id, sum(amount) as total_spent
    from orders
    group by customer_id
)
select customer_id, total_spent,
    round((total_spent*100.0) / (select sum(amount) from orders),2) as revenue_share_pct 
from customer
group by customer_id, total_spent
order by revenue_share_pct desc, customer_id
