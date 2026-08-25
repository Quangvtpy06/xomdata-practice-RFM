-- Xom Data · Ấn tượng đầu tiên trị giá bao nhiêu
-- Problem: https://xomdata.com/practice/medium-firstlast-003
-- Solved: 2026-08-25

with first_order as(
    select customer_id, order_date, amount,
    ROW_NUMBER() over(
        PARTITION BY customer_id
        order by order_date
    ) as r
    from orders
)
select customer_id, order_date as first_order_date, amount as first_amount
from first_order
where r = 1
order by customer_id
