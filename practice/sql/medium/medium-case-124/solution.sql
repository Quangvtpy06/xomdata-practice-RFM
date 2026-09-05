-- Xom Data · Classify student academic performance
-- Problem: https://xomdata.com/practice/medium-case-124
-- Solved: 2026-09-05

with student_detail as (
    select s.full_name, s.student_code, round(avg(c.final_score),2) as avg_score,
        case
            when avg(final_score) >=9 then 'Excellent'
            when 8 <= avg(final_score) and avg(final_score) < 9 then 'Good'
            when 7 <= avg(final_score) and avg(final_score) < 8 then 'Fair'
            when 5 <= avg(final_score) and avg(final_score) < 7 then 'Average'
            else 'Poor'
        end as grade
    from students s
    join scores c on s.id = c.student_id
    group by s.full_name, s.student_code
    order by avg_score desc
)
select full_name, student_code, avg_score, grade,
    DENSE_RANK() over(order by avg_score desc) as class_rank
from student_detail
order by avg_score desc, student_code
limit 20;
