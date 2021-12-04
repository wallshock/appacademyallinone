class String
    def maulin! n
      slice! n
      self
    end
    def maulin n
      dup.maulin! n
    end
end

def first_vowel_idx(word)
    vowels = "aoeiuAOEIU"
    word.each_char.with_index do |char,i|
        return i if vowels.include?(char)
    end
end

def last_vowel_idx(word)
    vowels = "aoeiuAOEIU"
    last = 0
    word.each_char.with_index do |char,i|
        last = i if vowels.include?(char)
    end
    last
end

def has_vowels?(word)
    vowels = "aoeiuAOEIU"
    word.each_char do |char|
        return true if vowels.include?(char)
    end
    return false
end

def alternating_vowel(sent)
    arr = sent.split(" ")
    vowels = "aoeiuAOEIU"
    count = 1
    arr.each do |word|
        if !count.even? && has_vowels?(word)
            word.maulin!(first_vowel_idx(word))
        elsif has_vowels?(word)
            word.maulin!(last_vowel_idx(word))
        end
        count += 1
    end
    arr.join(" ")
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday