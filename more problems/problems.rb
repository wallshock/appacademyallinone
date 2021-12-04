require 'prime'
def no_dupes?(arr)
    new_arr = []
    hash = Hash.new(0)
    arr.each do |k|
        hash[k] += 1
    end
    hash.each do |k,v|
        new_arr << k if v == 1
    end
    print new_arr
    puts
end

no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    (0...arr.length-1).each_with_index do |v,i|
        return true if arr.length == 1
        if arr[i+1] != nil
            return false if arr[i] == arr[i+1]
        end
    end
    return true
end

puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
puts no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    hash = Hash.new([])
    str.each_char.each_with_index do |char, i|
        hash[char] += [i]
    end
    print hash
    puts
end

char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    max = 0
    letter = ""
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] = str.count(char)
    end
    hash.each do |k,v|
        if hash[k] >= max
            max = v
            letter = k
        end
    end
    max.times {print letter}
    puts 
end

longest_streak('a')           # => 'a'
longest_streak('accccbbb')    # => 'cccc'
longest_streak('aaaxyyyyyzz') # => 'yyyyy
longest_streak('aaabbb')      # => 'bbb'
longest_streak('abc')         # => 'c'

require 'prime'

def bi_prime?(num)
    testing = num
    primesd = []
    primes_below = []
    result = 1

    (2...num).each do |el|
        primes_below << el if el.prime?
    end

    divided = false
    while !divided
        divided = true
        primes_below.each do |div|
            if testing % div == 0
                primesd << div
                testing = testing / div
                divided = false
            end
        end
    end

    primesd.each do |mult|
        result *= mult
    end
    return true if result == num && primesd.length == 2
    return false
end

puts bi_prime?(14)   # => true
puts bi_prime?(22)   # => true
puts bi_prime?(25)   # => true
puts bi_prime?(94)   # => true
puts bi_prime?(24)   # => false
puts bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    newm = ""
    i = 0
    j = 0
    alphabet = ("a".."z").to_a
    while message[i] != nil
        newm += alphabet[(alphabet.index(message[i])+keys[j%keys.length])%alphabet.length]
        i += 1
        j += 1
    end
    puts newm
end


vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
vigenere_cipher("zebra", [3, 0])            # => "ceerd"
vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiuo"
    first_vowel = nil
    last = ""  
    temp = nil
    final_word = ""
    str.each_char.with_index do |char,idx|
        first_vowel = idx if vowels.include?(char) && first_vowel == nil
        if !vowels.include?(char)
            final_word += char
        elsif temp != nil
            final_word += str[temp]
        else
            final_word += char
        end
        if vowels.include?(char)
            temp = idx
            last = char
        end
    end
    final_word[first_vowel] = last
    puts final_word
end

vowel_rotate('computer')      # => "cempotur"
vowel_rotate('oranges')       # => "erongas"
vowel_rotate('headphones')    # => "heedphanos"
vowel_rotate('bootcamp')      # => "baotcomp"
vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        return "" if prc.nil?
        new_str = ""
        self.each_char do |ch|
            new_str += ch if prc.call(ch)
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char,i|
            self[i] = prc.call(char, i)
        end
        self
    end
end


p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

def multiply(num, num2)
    return 0 if num2 == 0
    if num2 < 0
        -(num + multiply(num, (-num2) - 1))
    else
        num + multiply(num, num2 - 1)
    end
end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2  
    seq = lucas_sequence(length - 1)
    next_el = seq[-1] + seq[-2]
    seq << next_el
end

def prime_factorization(num)
    (2...num).each do |fact|
        if num % fact == 0
            other_fact = num / fact
            return [ *prime_factorization(fact), *prime_factorization(other_fact)]
        end
    end

    [ num ]
end



p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]