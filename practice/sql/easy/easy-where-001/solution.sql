-- Xom Data · Filter products by category
-- Problem: https://xomdata.com/practice/easy-where-001
-- Solved: 2026-08-19

select name, price, categories
from products
where categories like 'Electronics'
order by name
