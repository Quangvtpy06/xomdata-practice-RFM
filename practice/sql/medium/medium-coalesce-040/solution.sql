-- Xom Data · Book count and average price by genre
-- Problem: https://xomdata.com/practice/medium-coalesce-040
-- Solved: 2026-09-05


select genre_name, count(b.id) as book_count, round(COALESCE(avg(price),0),0) as avg_price,
    COALESCE(min(price),0) as min_price, COALESCE(max(price),0) as max_price,
    COALESCE(max(price) - min(price),0) as price_range,
    rank() over(order by count(b.id) desc) as coverage_rank,
    NTILE(3) over(order by count(b.id) desc, genre_name) as library_focus
from genres g
left join books b
on b.genre_id = g.id
GROUP BY genre_name
order by coverage_rank, genre_name;
