-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-08-21

select
    c.full_name,
    count(DISTINCT o.id) as order_count,
    sum(total_amount) as total_spending,
    avg(total_amount) as avg_order_value,
    ROW_NUMBER() over(
        order by sum(total_amount) desc, c.full_name asc
    ) as spending_rank
from customers c
left join orders o
on c.id = o.customer_id
group by c.full_name
