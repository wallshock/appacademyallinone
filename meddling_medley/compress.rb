def compress(word)
    newword = ""
    while !word.empty?
        word.each_char.with_index do |char, i|
            counting = true
            counter = 1
            enum = i
            while counting
                counting = false
                if word[enum] == word[enum+1] && word[enum+1] != nil
                    counter += 1
                    enum += 1
                    counting = true
                end
            end
            newword += char + counter.to_s if counter > 1
            newword += char if counter == 1
            word = word[counter..-1]
            break
        end
    end
    newword 
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"