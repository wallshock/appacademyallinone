def is_triangular?(n)
    nums = []
    i = 1
    while (i * (i + 1) / 2) <= n
        nums << (i * (i + 1) / 2)
        i += 1
    end
    return true if nums.include?(n)
    return false
end

def triangular_word?(str)
    letters = *('a'..'z')
    sum = 0
    str.each_char do |char|
        sum += letters.index(char) + 1
    end
    
    return true if is_triangular?(sum)
    return false
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false