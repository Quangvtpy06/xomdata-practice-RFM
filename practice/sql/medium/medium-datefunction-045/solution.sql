-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-09-05

with report as(
    select strftime('%Y-%m',transaction_date) as month,
        count(id) as transaction_count,
        sum(amount) as total_amount,
        lag(sum(amount)) over(order by transaction_date) as amount_thang_truoc
    from transactions
    group by strftime('%Y-%m',transaction_date)
)
select month, transaction_count, total_amount,
    (total_amount - amount_thang_truoc) as mom_delta
from report
order by month;
