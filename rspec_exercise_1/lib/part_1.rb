def average(num, num2)
    (num + num2) / 2.0
end

def average_array(nums)
 nums.sum / (nums.length * 1.0)
end

def repeat(str,num)
str*num
end

def yell(str)
str.upcase + "!"
end

def alternating_case(sentence)
arr = sentence.split(" ")
i = 0
    while i < arr.length
        arr[i].upcase! if i.even?
        arr[i].downcase! if !i.even?
        i += 1
    end
arr.join(" ")
end