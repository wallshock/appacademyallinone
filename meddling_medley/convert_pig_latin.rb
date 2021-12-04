def vowel_index(word)
    vowels = "AOEIUaoeiu"
    word.each_char.with_index do |char,i|
        return i if vowels.include?(char)
    end
end


def convert_pig_latin(str)
    vowels = "aoeiuAOEIU"
    arr = str.split(" ")
    arr.each.with_index do |word,i|
        cap = false
        if word.length >= 3
            if vowels.include?(word[0])
                arr[i] = word + "yay"
            else
                cap = true if arr[i][0].capitalize == arr[i][0]
                arr[i] = word[vowel_index(word)..-1] + word[0...vowel_index(word)] + "ay"
                arr[i].capitalize! if cap == true
            end
        end
    end
    arr.join(" ")       
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"