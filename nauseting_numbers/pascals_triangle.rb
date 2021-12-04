def pascals_triangle(n)
    triangle = []
    i = 1
    temp = []
    while i <= n
        triangle << [1] if i == 1
        triangle << [1,1] if i == 2
        if i > 2
            temp = []
            (0...i).each do |num|
                temp << 1 if num == 0
                temp << 1 if num == i-1
                if num != 0 && num != i-1
                    temp << triangle[i-2][num-1] + triangle[i-2][num]
                end
            end
            triangle << temp
        end
        i += 1
    end
    triangle
end


p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]