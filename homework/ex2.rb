def add_numbers(arr)
    return nil if arr.size == 0
    return arr[0] if arr.size == 1
    return arr[0] + add_numbers(arr[1..-1])
end

p add_numbers([1,2,3,4]) # => returns 10

p add_numbers([3]) # => returns 3

p add_numbers([-80,34,7]) # => returns -39

p add_numbers([]) # => returns nil