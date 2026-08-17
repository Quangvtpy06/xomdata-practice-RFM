-- Xom Data · Scholarship-eligible students
-- Problem: https://xomdata.com/practice/easy-where-010
-- Solved: 2026-08-17

select DISTINCT full_name, student_code, avg_score
from students
where avg_score >= 8.0 and avg_score IS NOT NULL
order by avg_score desc;
