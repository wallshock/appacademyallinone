def selected_map!(arr, prc, prc2)
    arr.each_with_index do |el,i|
        if prc.call(el)
            arr[i] = prc2.call(el)
        end
    end
    return nil
end


is_even = Proc.new { |n| n.even? }
is_positive = Proc.new { |n| n > 0 }
square = Proc.new { |n| n * n }
flip_sign = Proc.new { |n| -n }

arr_1 = [8, 5, 10, 4]
p selected_map!(arr_1, is_even, square)     # nil
p arr_1                                     # [64, 5, 100, 16]

arr_2 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_2, is_even, flip_sign)  # nil
p arr_2                                     # [10, -4, 7, -6, 2, -9]

arr_3 = [-10, 4, 7, 6, -2, -9]
p selected_map!(arr_3, is_positive, square) # nil
p arr_3                                     # [-10, 16, 49, 36, -2, -9]