require 'prime'

def primes_in_range(num,n)
    range = []
    div = 2
    satisfied = false
    while !satisfied
        range << div if div.prime? || div == num
        div += 1
        if range.index(num) != nil
            if range[range.index(num)+n] != nil
                satisfied = true
            end
        end
    end
    range
end

def pretentious_primes(arr, n)
    newarr = []
    arr.each do |num|
        range = primes_in_range(num,n)
        if range.index(num)+n < 0
            newarr << nil
        else
            newarr << range[range.index(num)+n]
        end
    end
    newarr
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
