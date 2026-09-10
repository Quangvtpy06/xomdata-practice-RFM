-- Xom Data · Cửa hàng giữ được bao nhiêu phần khách
-- Problem: https://xomdata.com/practice/medium-repeat-002
-- Solved: 2026-09-10

with pct as (
    select customer_id as cus_two_orders, count(order_id) as order_count
    from orders
    group by customer_id
)
SELECT ROUND(
    100.0 * SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) / COUNT(*),2) AS repeat_rate_pct
FROM pct
