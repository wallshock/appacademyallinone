require 'prime'
def mersenne_prime(n)
    i = 1
    count = 0
    while count<n
        prime = nil
        if (2**i - 1).prime?
            prime = (2**i - 1)
            count += 1
        end
        i += 1
    end
    prime
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071