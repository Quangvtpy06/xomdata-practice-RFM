-- Xom Data · Thứ bậc chi tiêu trong nội bộ mỗi kênh
-- Problem: https://xomdata.com/practice/medium-classify-002
-- Solved: 2026-08-25

select channel, o.customer_id, sum(amount) as total_spent,
    DENSE_RANK() over(
        PARTITION BY channel
        order by sum(amount) desc
    ) as rank_in_channel
from orders o
left join customers c
on o.customer_id = c.customer_id
where o.order_id IS NOT NULL
group by o.customer_id, channel
order by channel, rank_in_channel, o.customer_id
