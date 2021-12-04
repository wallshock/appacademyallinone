def perfect_square(n)
    return true if n == 1
    (1..n/2).each do |i|
        return true if i*i == n
    end
    return false
end
p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false