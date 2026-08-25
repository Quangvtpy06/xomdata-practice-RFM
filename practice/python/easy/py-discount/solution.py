# Xom Data · Compute price after discount
# Problem: https://xomdata.com/practice/py-discount
# Solved: 2026-08-25

def final_price(price, percent):
    result = price - (percent/100) * price
    return result
