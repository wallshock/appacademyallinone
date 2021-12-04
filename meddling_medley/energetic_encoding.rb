def energetic_encoding(str,hash)
    strnew = ""
    str.each_char do |char|
        if hash.include?(char)
            strnew += hash[char]
        elsif char == " "
            strnew += " "
        else
            strnew += "?"
        end
    end
    strnew
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'