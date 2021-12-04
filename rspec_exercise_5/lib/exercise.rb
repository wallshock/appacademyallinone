def zip(*arrays)
    new = []
    arrays.each do |array|
        array.each_with_index do |ncos, i|
            new[i] = Array.new if new[i] == nil
            new[i] << array[i]
        end
    end
    new
end

def prizz_proc(arr, prc1, prc2)
    ar2 = []
    arr.each do |el|
        ar2 << el if (prc1.call(el) || prc2.call(el)) && !(prc1.call(el) && prc2.call(el))
    end
    ar2
end

def zany_zip(*arrays)
    new = [] 
    length = arrays.map(&:length).max
    arrays.each do |array|
        i = 0
        (0...length).each do |i|
        new[i] = Array.new if new[i] == nil
        if array[i] == nil
            new[i] << nil
        else
            new[i] << array[i]
        end
        end
    end
    new
end

def maximum(ary, &blk)
    max = nil
    if !ary.empty?
        ary.each do |el|
            max = el if max == nil 
            max = el if blk.call(el) >= blk.call(max)
        end
    else
        return nil
    end
    max
end

def my_group_by(array, &blk)
    hash = Hash.new([])
    array.each do |el|
        hash[blk.call(el)] += [el]
    end
    hash
end

def max_tie_breaker(arr, prc, &blk)
    if !arr.empty?
        maxel = "huj"
        arr.each do |el|
            maxel = el if maxel == "huj"
            maxel = el if blk.call(el) > blk.call(maxel)
            maxel = el if (blk.call(el) == blk.call(maxel)) && (prc.call(el) > prc.call(maxel))
        end
        return maxel
    end
    return nil
end

def vovel_count(sent)
    vovels = "aoeiu"
    count = 0
    sent.each_char do |char|
        count += 1 if vovels.include?(char)
    end
    count
end

def change_word(word)
    indices = vowel_indices(word)
    word[indices.first..indices.last]
end

def vowel_indices(word)
    vowels = 'aeiou'
    indices = []
    word.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end
    indices
end

def silly_syllables(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        num_vowels = vowel_indices(word).length
        if num_vowels < 2
            word
        else
            change_word(word)
        end
    end
    new_words.join(' ')
end