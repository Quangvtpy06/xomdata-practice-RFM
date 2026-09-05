-- Xom Data · Products more expensive than the category average
-- Problem: https://xomdata.com/practice/medium-subquery-103
-- Solved: 2026-09-05

with price_average as (
    select category, avg(price) as avg_price
    from products
    group by category
)

select s.product_name, s.category, s.price,
    round((s.price - p.avg_price),0) as diff_from_avg,
    round((s.price - p.avg_price) * 100.0 / p.avg_price,2) as pct_above
from price_average p
join products s on p.category = s.category
where s.price > p.avg_price
group by product_name
order by pct_above desc, product_name;
