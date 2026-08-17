-- Xom Data · Top-scoring players
-- Problem: https://xomdata.com/practice/easy-where-027
-- Solved: 2026-08-17

select full_name, goals_scored
from players
where goals_scored > 10
ORDER BY goals_scored desc;
