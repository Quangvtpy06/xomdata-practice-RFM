-- Xom Data · Kênh nào đang giữ được hơi ấm
-- Problem: https://xomdata.com/practice/medium-recency-005
-- Solved: 2026-08-25

with customer_quiet as (
    select channel, o.customer_id,
        ((strftime('%s', '2024-06-30') - strftime('%s', max(o.order_date))) / (60*60*24)) as days_silent
    from orders o
    left JOIN customers c
    on o.customer_id = c.customer_id
    where o.customer_id is not null
    group by channel, o.customer_id
)
select channel, count(customer_id) as customers, round(avg(days_silent),2) as avg_days_silent
from customer_quiet
group by channel
order by avg_days_silent, channel
