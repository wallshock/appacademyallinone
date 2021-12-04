def palindrome?(word)
    inv = []
    i=0
    while i < word.length
        inv << word[word.length-(i+1)]
        i += 1
    end
    return true if inv.join.to_s == word
    return false if inv.join.to_s != word
end

def substrings(word)
    i = 0
    j = 0
    temp = ""
    arr = []
    while i < word.length
        j = i
        while j < word.length
        temp = word[j] if j == i
        temp = temp + word[j] if j > i
        arr << temp
        j += 1 
        end
        i += 1
    end
    arr
end

def palindrome_substrings(word)
    i=0
    arr = []
    while i < substrings(word).length
        if substrings(word)[i].length>1
            if palindrome?(substrings(word)[i])
                arr << substrings(word)[i]
            end
        end
        i += 1
    end
    arr
end