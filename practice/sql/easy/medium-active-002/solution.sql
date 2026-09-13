-- Xom Data · Ai ghé đủ cả hai tháng liền nhau
-- Problem: https://xomdata.com/practice/medium-active-002
-- Solved: 2026-09-13

select customer_id
from orders
where strftime('%Y-%m',order_date) = '2024-03'

intersect --lay phan giao cua ca 2 thang

select customer_id
from orders
where strftime('%Y-%m',order_date) = '2024-04'
