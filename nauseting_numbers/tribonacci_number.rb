def tribonacci_number(n)
    return 1 if n == 1
    return 1 if n == 2
    return 2 if n == 3
    tribo = tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274