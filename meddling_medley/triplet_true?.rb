def triplet_true(str)
    str.each_char.with_index do |char,i|
        if str[i+2] != nil
            return true if str[i] == str[i+1] && str[i+1] == str[i+2]
        end
    end
    return false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false