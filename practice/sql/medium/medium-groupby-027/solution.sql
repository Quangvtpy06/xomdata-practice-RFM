-- Xom Data · Average score per subject
-- Problem: https://xomdata.com/practice/medium-groupby-027
-- Solved: 2026-09-05

with cte as (
    select subject_id, 
        count(id) as student_count,
        round(avg(final_score),2) as avg_score,
        round(100.0*sum(case
            when final_score >=5 then 1
            else 0
        end) / count(g.id),2) as pass_rate
    from grades as g
    group by subject_id
)
select s.subject_name, s.credits, c.student_count, c.avg_score, pass_rate,
    rank() over(order by c.avg_score desc) as rank_by_avg,
    ROW_NUMBER() over(PARTITION BY 4 order by c.avg_score desc) as difficulty_quartile
from cte c
JOIN subjects s on c.subject_id = s.id
order by rank_by_avg, subject_name
