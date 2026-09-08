-- Xom Data · Top 3 products by sales in each category
-- Problem: https://xomdata.com/practice/hard-topn-001
-- Solved: 2026-09-08

with product_cat as (
    select category, name as product_name, units_sold,
        DENSE_RANK() over(PARTITION BY category order by units_sold desc) as rank_in_cat
    from products
)
select category, product_name, units_sold, rank_in_cat
from product_cat
where rank_in_cat <= 3
order by category, rank_in_cat, product_name
