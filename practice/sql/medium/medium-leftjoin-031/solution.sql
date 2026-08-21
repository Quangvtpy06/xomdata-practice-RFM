-- Xom Data · Candidates not yet interviewed
-- Problem: https://xomdata.com/practice/medium-leftjoin-031
-- Solved: 2026-08-21

select c.full_name, c.email, c.application_date,
    ROW_NUMBER() over(
        order by c.application_date, c.full_name
    ) as queue_position,
    round((percent_rank() over(order by c.application_date))*100,2) as older_than_pct
from candidates c
left join interviews i
on c.id = i.candidate_id
where i.id IS NULL
