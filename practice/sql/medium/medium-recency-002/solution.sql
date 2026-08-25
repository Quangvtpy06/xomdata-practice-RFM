-- Xom Data · Ba mươi ngày vắng bóng
-- Problem: https://xomdata.com/practice/medium-recency-002
-- Solved: 2026-08-25

select customer_id, max(order_date) as last_order_date
from orders
group by customer_id
having (strftime('%s', '2024-06-30') - strftime('%s', max(order_date))) / (60*60*24) > 30
