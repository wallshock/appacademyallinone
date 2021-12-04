def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays(twod_arr)
    twod_arr.count {|sub| sub.sum > 0}
end

def aba_translate(str)
    vowels = "aoeiu"
    word = str.split("")
    word.map! do |char|
        char = char + "b" + char if vowels.include?(char)
        char = char if !vowels.include?(char)
    end
    word.join
end

def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end