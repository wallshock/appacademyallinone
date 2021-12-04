def divc(n)
    div = 0
    (2...n).each do |el|
        div += 1 if n % el == 0
    end
    div 
end

def anti_prime?(n)
    arr = []
    (2...n).each do |el|
        arr << divc(el)
    end
    return false if arr.any? {|div| div > divc(n)}
    return true
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false