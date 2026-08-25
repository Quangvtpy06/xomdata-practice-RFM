-- Xom Data · Đơn hàng để đời của mỗi khách
-- Problem: https://xomdata.com/practice/medium-monetary-004
-- Solved: 2026-08-25

with best_amount as (
    select customer_id, order_id, order_date, amount,
    ROW_NUMBER() over(
        PARTITION BY customer_id
        ORDER BY amount desc, order_date, order_id
    ) as order_rank
    from orders
)
select customer_id, order_id, order_date, amount
from best_amount
where order_rank = 1
order by customer_id
