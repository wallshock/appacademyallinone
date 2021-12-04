
a = 0
b = 0

def c(a,b)
    Math.sqrt(a*a+b*b)
end

def checkifpit(a,b)
    return true if c(a,b).to_i == c(a,b)
    return false
end


def finderofpits
    (1..999).each do |a|
        (1..999).each do |b|
            if checkifpit(a,b)
                return a,b if a+b+c(a,b) == 1000
            end
        end
    end
end

p finderofpits