-- Xom Data · Quý khởi đầu của mỗi khách
-- Problem: https://xomdata.com/practice/medium-cohort-005
-- Solved: 2026-09-13

with rank_orders as (
    select customer_id, order_date, 
        ROW_NUMBER() over(PARTITION BY customer_id order by order_date, order_id) as num_order
    from orders
)
select customer_id, strftime('%Y', order_date) || '-Q' || -- || dung de noi toan tu
    cast((strftime('%m', order_date)-1) / 3+1 as integer) as first_quarter
from rank_orders
where num_order = 1
