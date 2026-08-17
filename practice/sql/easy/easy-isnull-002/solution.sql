-- Xom Data · Patients without a health-insurance declaration
-- Problem: https://xomdata.com/practice/easy-isnull-002
-- Solved: 2026-08-17

select full_name
from patients
where health_insurance IS NULL
order by full_name;
