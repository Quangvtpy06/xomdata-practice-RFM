-- Xom Data · Ba vòng tròn độ tươi của tệp khách
-- Problem: https://xomdata.com/practice/medium-recency-004
-- Solved: 2026-08-25

with cte as (
    select customer_id,
        (strftime('%s', '2024-06-30') - strftime('%s',max(order_date)))/(60*60*24) as  quiet_date
    from orders
    group by customer_id
)
select
    case
        when quiet_date BETWEEN 0 and 30 then 'hot'
        when quiet_date BETWEEN 31 and 90 then 'warm'
        else 'cold'
    end as freshness_bucket,
    count(customer_id) as customer_count
from cte
group by freshness_bucket
order by
    case freshness_bucket
        when 'hot' then 1
        when 'warm' then 2
        when 'cold' then 3
    end
