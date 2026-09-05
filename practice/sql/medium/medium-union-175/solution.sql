-- Xom Data · Summary of issues to handle
-- Problem: https://xomdata.com/practice/medium-union-175
-- Solved: 2026-09-05

with report_type as (
    select 'Complaint' as type, count(*) as quantity
    from complaints
    where status = 'Pending'

    UNION ALL

    select 'Cancelled Order' as type, count(*) as quantity
    from orders
    where status = 'Cancelled'

    UNION ALL

    select 'Out of Stock Product' as type, count(*) as quantity
    from products
    where status = 'Out of Stock'
),
rank_type as(
    select type, quantity,
        quantity * 100.0 / nullif(sum(quantity) over(),0) as pct, /*NULLIF(value1,value2) neu 
        value1 = value2 output: null va value1 != value2 output: value1*/
        rank() over(order by quantity desc) as rank_pos
    from report_type
)
select type, quantity, round(pct,2) as pct_of_total, rank_pos,
    round(sum(pct) over(order by rank_pos,type),2) as cumulative_pct
from rank_type
order by rank_pos, type
