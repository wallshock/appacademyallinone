def is_prime?(n)
    if n >= 2
        (2...n).each do |div|
            return false if n%div == 0
        end
        return true
    end
    return false
end

def nth_prime(n)
    count = 0
    it = 0
    while count < n
        it += 1
        count += 1 if is_prime?(it)
    end
    return it
end

def prime_range(min,max)
    arr = []
    (min..max).each do |num|
        arr << num if is_prime?(num)
    end
    return arr
end