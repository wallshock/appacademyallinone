def squaragonal?(arr)
    count = 0
    i = arr.length-1
    same = true
    if arr[0][0] == arr[-1][-1] 
        while i>=0
            if arr[i][i] != arr[0][0]
                break
            else
                count += 1
            end
            i -= 1
        end
        return true if count == arr.length
    end

    if arr[0][-1] == arr[-1][0]
        j = 0
        l = arr.length-1
        while j < l
            if arr[j][l-j] != arr[0][-1]
                break
            else
                count += 1
            end
            j += 1
        end
        return true if count == arr.length
    end

    
    return false
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false