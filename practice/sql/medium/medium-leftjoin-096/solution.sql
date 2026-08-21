-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-08-21

select
    u.full_name,
    u.username,
    u.account_type,
    ROW_NUMBER() over(order by created_at) as signup_order,
    DENSE_RANK() over(ORDER BY created_at) as tenure_quartile
from users u 
left join posts p
on u.id = p.user_id
where p.id IS NULL
