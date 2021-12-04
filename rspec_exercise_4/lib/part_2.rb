def proper_factors(n)
    factors = []
    (1...n).each do |factor|
        factors << factor if n%factor == 0
    end
    factors
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(n)
    return true if n == aliquot_sum(n)
    return false
end

def ideal_numbers(i)
    count = 0
    n = 1
    perfs = []
    while count < i
        if perfect_number?(n)
            count += 1
            perfs << n
        end
        n += 1
    end
    perfs
end