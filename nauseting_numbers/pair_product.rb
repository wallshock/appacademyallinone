def pair_product(arr, product)
    pairs = 0
    arr.each do |el|
        arr.each do |el2|
            if el != el2
                pairs += 1 if el * el2 == product
            end
        end
    end 
    return true if pairs > 0
    return false
end



p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false