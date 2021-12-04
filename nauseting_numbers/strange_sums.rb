def strange_sums(arr)
    pairs = 0
    arr.each do |el|
        arr.each do |el2|
            if el != el2
                pairs += 1 if el + el2 == 0
            end
        end
    end 
    pairs/2
end




p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0