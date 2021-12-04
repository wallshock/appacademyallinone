def partition (arr, num)
    sub1 = []
    sub2 = []
    arr.each do |num2|
        sub1 << num2 if num2 < num
        sub2 << num2 if num2 >= num
    end
    [sub1,sub2]
end

def merge(hash1, hash2)
    hash_out = {}
    hash1.each do |k,v|
        hash_out[k] = v
    end
    hash2.each do |k,v|
        hash_out[k] = v
    end
    hash_out
end

def censor(sentence, arr)
    vowels = "aoeiu"
    censored = []
    sent = sentence.split(" ")
    sent.each do |word|
        censored << word if !arr.include?(word.downcase) 
        if arr.include?(word.downcase)
            word.each_char.with_index do |lett,idx|
            word[idx] = "*" if vowels.include?(word[idx].downcase)
            end
        censored << word
        end
    end
    censored.join(" ")
end

def power_of_two?(n)
    if n.even?
        i = 2
        while i<=n
            return true if i == n
            i *= 2 
         end
    end
    if n == 1
        return true
    else 
        return false
    end
end