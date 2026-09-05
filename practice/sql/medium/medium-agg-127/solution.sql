-- Xom Data · Top 10 highest-paid employees and their leave days
-- Problem: https://xomdata.com/practice/medium-agg-127
-- Solved: 2026-09-05

with sala_emp as (
    -- Tong luong cua tung nhan vien
    select e.id,e.full_name, e.employee_code, e.department_id, d.department_name,
        sum(net_salary) as total_received_salary
    from employees e
    join departments d on d.id = e.department_id
    join payroll p on e.id = p.employee_id
    group by e.id, d.department_name
),
leave_emp as (
    -- So ngay nghi cua tung nhan vien
    select employee_id, count(id) as leave_count
    from leaves
    where status = 'approved'
    group by employee_id
),
dep_avg_salary as (
    -- Luong trung binh cua moi phong ban
    select DISTINCT s.department_id, 
        avg(total_received_salary) over(PARTITION BY department_name) as avg_salary
    from sala_emp s
)
select full_name, employee_code, department_name, total_received_salary, 
    COALESCE(leave_count,0) as leave_count,
    round((total_received_salary - avg_salary) * 100.0 / avg_salary ,2) as pct_above_dept_avg
from sala_emp s
join dep_avg_salary d on s.department_id = d.department_id
left join leave_emp l on s.id = l.employee_id
order by total_received_salary desc, employee_code
limit 10;
