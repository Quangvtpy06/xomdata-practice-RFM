-- Xom Data · Khách một lần ghé và khách quay lại
-- Problem: https://xomdata.com/practice/medium-repeat-001
-- Solved: 2026-08-26

with type as (
    select customer_id,
        case
            when count(order_id) = 1 then 'one-time'
            else 'repeat'
        end as customer_type 
    from orders
    group by customer_id
)
select customer_type, count(customer_id) as customer_count
from type
group by customer_type
