class Array
    def factors(num)
        factors = []
        self.each do |number|
            factors << number if num % number == 0
        end
        factors
    end

    def bubble_sort!(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false

        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end

        self
    end
    
    def bubble_sort(&prc)
        selfie = self.dup
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false

        while !sorted
            sorted = true
            (0...selfie.length - 1).each do |i|
                if prc.call(selfie[i], selfie[i+1]) == 1
                    selfie[i], selfie[i+1] = selfie[i+1], selfie[i]
                    sorted = false
                end
            end
        end

        selfie
    end

    

end

def substrings(string)
    arr = []
    i = 0
    while i < string.length
        j = i
        temp = ""
        while j < string.length
            temp += string[j]
            arr << temp
            j += 1
        end
        i += 1
    end
    arr
end

def subwords(string, dictionary)
    words = []
    substrings(string).each do |word|
        words << if dictionary.include?(word)
    end
    words
end
        

