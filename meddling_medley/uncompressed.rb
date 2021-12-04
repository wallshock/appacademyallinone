def uncompress(str)
    news = []
    nums = "0123456789"
    str.each_char.with_index do |char, i|
        if nums.include?(char)
            char.to_i.times do
                news << str[i-1]
            end
        end
    end
    news.join
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'