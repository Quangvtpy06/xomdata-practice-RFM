-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-08-17

select name, 
    categories, 
    total_sold,
    case
        when total_sold >= 100 then 'Best Seller'
        when total_sold >= 50 then 'Average'
        else 'Slow Mover'
    end as classification,
    DENSE_RANK() over(
        PARTITION BY categories
        order by total_sold desc
    ) as rank_in_cat,
    round((total_sold * 100.0) / sum(total_sold) over (PARTITION BY categories), 2) as pct_of_cat_total
from (
    select p.name, p.categories, sum(t.quantity) as total_sold
    from products p
    join transactions t
        on p.id = t.product_id
    group by p.id, p.name, p.categories
)
order by categories, rank_in_cat, name;
