# Xom Data · Total receipts
# Problem: https://xomdata.com/practice/py-sum-positive
# Solved: 2026-08-25

def sum_positive(numbers):
    result = 0
    for i in numbers:
        if i >0:
            result += i
    return result
