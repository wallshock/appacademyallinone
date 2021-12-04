def checker(*arrs)
    length = nil
    arrs.each do |arr|
        length = arr.length if length == nil
        return false if arr.length != length
    end
    return true
end


def matrix_addition_reloaded(*arrs)
    newarr = []
    if checker(*arrs)
        arrs.each do |array|
            (0...array.length).each do |i|
                if newarr[i] == nil
                    newarr[i] = Array.new(array[i])
                else
                    newarr[i][0] += array[i][0]
                    newarr[i][1] += array[i][1]
                end
            end
        end
    else
        return nil
    end
    newarr
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil