-- Xom Data · Tuổi đời mua sắm của khách
-- Problem: https://xomdata.com/practice/medium-cohort-006
-- Solved: 2026-09-13

with cte as(
    select customer_id, strftime('%Y-%m',min(order_date)) as first_month,
        strftime('%Y-%m',max(order_date)) as last_month,
        min(order_date) as min_date,
        max(order_date) as max_date
    from orders
    group by customer_id
)
-- theo cong thuc (nam sau - nam truoc)
select customer_id, first_month, last_month,
    (CAST(strftime('%Y', max_date) AS INTEGER) - CAST(strftime('%Y', min_date) AS INTEGER)) * 12 
    + (CAST(strftime('%m', max_date) AS INTEGER) - CAST(strftime('%m', min_date) AS INTEGER)) AS tenure_months
from cte
