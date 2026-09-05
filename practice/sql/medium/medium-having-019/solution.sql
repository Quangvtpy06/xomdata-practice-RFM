-- Xom Data · High-rated sellers with many orders
-- Problem: https://xomdata.com/practice/medium-having-019
-- Solved: 2026-09-05

with store_detail as (
    select store_name, reputation_score, count(o.id) as order_count,
        DENSE_RANK() over(order by count(o.id) desc) as rank_by_orders
    from sellers s
    join orders o
    on s.id = o.seller_id
    where reputation_score >= 4.5
    group by store_name, reputation_score
    having count(o.id) >= 3
)
select store_name, reputation_score, order_count, rank_by_orders,
    sum(order_count) over(order by order_count desc, store_name) as cumulative_orders
from store_detail
order by rank_by_orders, store_name;
