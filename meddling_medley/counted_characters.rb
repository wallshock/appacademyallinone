def counted_characters(str)
    arr = str.split("")
    fin = []
    arr.each do |char|
        fin << char if (arr.count(char) > 2) && !fin.include?(char)
    end
    fin
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []