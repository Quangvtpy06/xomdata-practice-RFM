-- Xom Data · Median and percentile salary by department
-- Problem: https://xomdata.com/practice/hard-percentile-001
-- Solved: 2026-09-08

---cte phan vi
with rank_salary as (
    select department, salary,
        percent_rank() over(PARTITION BY department ORDER BY salary) as p_rank
    from employees
    GROUP BY id, department
),
p_diff as (
    select department, salary, p_rank,
        --- use abs de tim gia tri tuyet doi tranh bi am
        abs(p_rank - 0.25) as diff25,
        abs(p_rank - 0.5) as diff5,
        abs(p_rank - 0.75) as diff75
    from rank_salary
)
SELECT department,
    --- tim muc luong o vi tri phan vi gan 0.25
    (select salary
    from p_diff p2
    where p2.department = p1.department
    ORDER BY diff25, salary
    limit 1) as p25,
    --- tim muc luong o vi tri phan vi gan 0.50
    (select salary
    from p_diff p2
    where p2.department = p1.department
    ORDER BY diff5, salary
    limit 1) as p50,
    --- tim muc luong o vi tri phan vi gan 0.75
    (select salary
    from p_diff p2
    where p2.department = p1.department
    ORDER BY diff75, salary
    limit 1) as p75
from p_diff p1
GROUP BY department
order by department
