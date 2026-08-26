-- Xom Data · Gắn nhãn khách còn gắn bó hay đã rời đi
-- Problem: https://xomdata.com/practice/medium-churn-001
-- Solved: 2026-08-26

select customer_id, max(order_date) as last_order_date,
    case
        when ((strftime('%s', '2024-06-30') - strftime('%s',max(order_date)))/(60*60*24)) > 90 then 'churned'
        else 'active'
    end as status
from orders
group by customer_id
