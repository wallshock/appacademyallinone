def sum_to(n)
    return nil if n<0
    return 0 if n == 0
    return 1 if n == 1
    return n + sum_to(n-1)
end

p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil