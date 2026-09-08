-- Xom Data · Total payroll by org branch
-- Problem: https://xomdata.com/practice/hard-recursive-001
-- Solved: 2026-09-08

WITH RECURSIVE level_manager AS (
    -- Moi nhan vien tu quan ly chinh ho
    SELECT 
        id AS manager_id,
        id AS employee_id,
        0 AS diff_level -- khoang cach cua quan ly va chinh ho
    FROM employees

    UNION ALL --- lay ca 2 bang
--- de quy tim lien tuc cho den khi nao khong con cap duoi nua
    -- Tim cap duoi cua cap quan ly
    SELECT 
        m.manager_id, --id cua manager
        e.id AS employee_id, --id cua cap quan ly duoi manager
        m.diff_level + 1 --cap quan ly ke tiep
    FROM level_manager m
    JOIN employees e ON m.employee_id = e.manager_id
)
SELECT 
    e1.id AS manager_id,
    e1.name AS manager_name,
    COUNT(CASE WHEN m.diff_level = 1 THEN 1 END) AS direct_reports, -- khi depth = 2 la cap quan ly chi duoi 1 nguoi thi tra ve direct_reports la 1
    COUNT(m.employee_id) AS subtree_size,
    SUM(e2.salary) AS subtree_salary
FROM level_manager m
JOIN employees e1 ON m.manager_id = e1.id
JOIN employees e2 ON m.employee_id = e2.id
GROUP BY e1.id, e1.name
HAVING COUNT(CASE WHEN m.diff_level = 1 THEN 1 END) > 0
ORDER BY subtree_salary DESC, manager_id ASC;
