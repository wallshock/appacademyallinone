def consecutive_collapse(arr)
    finished = false
    while !finished
if !arr.empty?
    arr.each.with_index do |num, i|
        finished = true
        if arr[i+1] != nil
        if arr[i] == arr[i+1] + 1 || arr[i] == arr[i+1] - 1
            arr.delete_at(i)
            arr.delete_at(i)
            finished = false
            break
        end
    end
    end
else
    return []
end
    end
    arr        
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []