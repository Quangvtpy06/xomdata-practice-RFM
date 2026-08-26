-- Xom Data · Tháng chào sân của từng khách
-- Problem: https://xomdata.com/practice/medium-cohort-003
-- Solved: 2026-08-26

with cte as (
    select customer_id, order_id, strftime('%Y-%m', order_date) as order_date,
        DENSE_RANK() over(
            PARTITION BY customer_id
            order by order_date
        ) as number_order
    from orders
    group by customer_id, order_id
    order by order_id
)
select DISTINCT (customer_id)
    customer_id, order_date as cohort_month
from cte
where number_order = 1
order by cohort_month, customer_id
