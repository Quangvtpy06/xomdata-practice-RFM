-- Xom Data · Students above the subject average
-- Problem: https://xomdata.com/practice/medium-subquery-028
-- Solved: 2026-08-21

with gradestats as(
select t.full_name, s.subject_name, g.final_score, 
    round(avg(g.final_score) over(PARTITION BY g.subject_id),2) as subject_avg,
    round(g.final_score - avg(g.final_score) over(PARTITION BY g.subject_id),2) as diff_from_avg
from grades g
join subjects s on g.subject_id = s.id
join students t on g.student_id = t.id
)
select *
from gradestats
where final_score > subject_avg
order by diff_from_avg desc, subject_name, full_name;
