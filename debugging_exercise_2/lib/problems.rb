# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end

def largest_prime_factor(n)
    factors = []
    if prime?(n)
        return n
    else
    (2...n).each do |divs|
    factors << divs if n % divs == 0 && prime?(divs)
    end
    end
    factors[-1]
end

def unique_chars?(str)
    str.each_char.with_index do |char, i|
        str.each_char.with_index do |char2, i2|
        return false if char == char2 && i != i2
        end
    end
    return true
end

def dupe_indices(arr)
    hash = Hash.new([])
    ar2 = []
    arr.each_with_index do |char,i|
        hash[char] += [i] if arr.count(char) >= 2
    end
    hash  
end

def ana_array(arr_1, arr_2)
    arr_1.each do |sym|
        return false if !arr_2.include?(sym)
    end
    arr_2.each do |sym|
        return false if !arr_1.include?(sym)
    end
    return true
end