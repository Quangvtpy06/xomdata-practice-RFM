-- Xom Data · Bao lâu rồi khách chưa quay lại
-- Problem: https://xomdata.com/practice/medium-recency-001
-- Solved: 2026-08-25

select customer_id,
    max(order_date) as last_order_date,
    (strftime('%s','2024-06-30') - strftime('%s', max(order_date))) / (60*60*24) as days_since
from orders
group by customer_id
order by days_since, customer_id
