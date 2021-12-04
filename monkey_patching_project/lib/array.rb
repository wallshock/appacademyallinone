# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return (self.max - self.min).abs if self.length > 0
        return nil if self.length == 0
    end

    def average
        return self.sum / (self.length * 1.0) if self.length > 0
        return nil if self.length == 0
    end

    def median
        return self.sort[(self.length)/2] if !self.length.even? && self.length != 0
        return (self.sort[(self.length-1)/2] + self.sort[self.length/2])/2.0 if self.length.even? && self.length != 0
        return nil if self.length == 0
    end
    
    def counts
        hash = Hash.new(0)
        self.each do |el|
            hash[el] += 1
        end
        hash
    end

    def my_count(val)
        hash = self.counts
        return hash[val]
    end

    def my_index(val)
        self.each_with_index do |el, i|
            return i if el == val
        end
    return nil
    end

    def my_uniq
        new = []
        self.each do |word|
            new << word if !new.include?(word)
        end
        new
    end

    def my_transpose
        new = []
        i = 0
        while i < self[1].length
            temp = []
            self.each do |arr|
                temp << arr[i]
            end
            new << temp
            i += 1
        end
        new
    end
end
