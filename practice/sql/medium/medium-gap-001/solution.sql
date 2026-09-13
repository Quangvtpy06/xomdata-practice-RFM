-- Xom Data · Khoảng lặng giữa hai lần mua liền kề
-- Problem: https://xomdata.com/practice/medium-gap-001
-- Solved: 2026-09-13

with lagged_orders as( -- dung LAG de lay don hang truoc do theo order date voi tung customer
    select customer_id, order_date, 
        lag(order_date) over(PARTITION BY customer_id 
            order by order_date, order_id) as prev_order_date --lay ra don hang dau tien
    from orders
)
select customer_id, order_date, cast(julianday(order_date) - julianday(prev_order_date) as integer) as days_since_prev
from lagged_orders
where prev_order_date is not null -- neu null thi do la don hang dau tien
order by customer_id, order_date, days_since_prev
