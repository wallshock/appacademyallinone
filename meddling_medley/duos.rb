def duos(str)
    count = 0
    str.each_char.with_index do |char,i|
        if str[i+1] != nil
            count += 1 if char == str[i+1]
        end
    end
    count
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0