def all_equal?(arr)
    arr.uniq.size <= 1
end

def squarocol?(arr)
    same = false
    arr.each do |array|
        return true if all_equal?(array)
    end
    temp = nil
    
    arr.each do |array|
        if temp == nil
            temp = Array.new(array) 
        else
            array.each.with_index do |char, i|
                if temp.include?(char) && temp.index(char) == i
                    count = 0
                    (0...arr.length).each do |j|
                        count += 1 if arr[j][i] == char
                        break if arr[j][i] != char
                    end
                return true if count == arr.length
                end
            end
            return false
        end
    end
end


p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false