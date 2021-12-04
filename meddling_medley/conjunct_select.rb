def conjunct_select(arr,*prcs)
    selected = false
    while !selected
        selected = true
        prcs.each do |prc|
            if arr.select {|el| prc.call(el)} != arr
                arr.select! {|el| prc.call(el)}
                sorted = false 
            end
        end
    end
    arr
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]