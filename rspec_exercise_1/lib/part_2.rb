def hipsterfy(word)
vowels = "aoeiu"
i = 0
    while i < word.length
        idx = i if vowels.include?(word[i])
        i += 1
    end
    word[idx] = "" if idx != nil
    word
end

def vowel_counts(str)
vowels = "aoeiu"
    hash = Hash.new(0)
    str.downcase.each_char do |char|
        hash[char] += 1 if vowels.include?(char)
    end
    hash
end

def caesar_cipher(mess, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    output = []
    mess.each_char do |char|
        if alphabet.include?(char)
            output << alphabet[(alphabet.index(char) + n)%26]
        else 
            output << char
        end
    end
    output.join
end