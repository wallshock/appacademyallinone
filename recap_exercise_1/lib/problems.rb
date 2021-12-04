# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = "aoeiu"
    arr = []
    words.each.with_index do |word,i|
        words.each.with_index do |word2,i2|
            if word != word2
                pair = word + " " + word2 if i<i2
                pair = word2 + " " + word if i2<i
                if pair != nil
                    contains = String.new(vowels)
                    pair.each_char do |char|
                        contains.delete!(char) if contains.include?(char)
                    end
                    arr << pair if contains.empty? && !arr.include?(pair)
                end
            end           
        end
    end
    return arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |div|
        return true if num%div == 0
    end
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []
    str.each_char.with_index do |char,i|
        bio = str[i] + str[i+1] if str[i+1] != nil
        arr << bio if bigrams.include?(bio)
    end
    return arr.sort_by!{|bio| bigrams.index(bio)}
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new{|k,v| k == v}
        new_hash = {}
        self.each do |k,v|
            new_hash[k] = v if prc.call(k,v)
        end

        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        (0...self.length).each do |start_idx|
            (start_idx...self.length).each do |en_idx|
                sub = self[start_idx..en_idx]
                subs << sub
            end
        end

        if length.nil?
            subs
        else
            subs.select {|el| el.length == length}
        end  
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        new_s = ""
        alphabet = ("a".."z").to_a
        self.each_char do |char|
            new_s += alphabet[(alphabet.index(char)+num)%alphabet.length]
        end
        new_s
    end
end
