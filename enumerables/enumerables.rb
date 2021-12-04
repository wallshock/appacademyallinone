class Array
    def my_each(&prc)
        self.length.times do |i|
          prc.call(self[i])
        end
    
        self
    end

    def my_select(&prc)
        selects = []

        self.my_each do |item|
          selects << item if prc.call(item)
        end
    
        selects
    end

    def my_reject(&prc)
        selects = []

        self.my_each do |item|
          selects << item if !prc.call(item)
        end
    
        selects
    end
    
    def my_any?(&prc)
        self.my_each do |item|
            return true if prc.call(item)
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |item|
            return false if !prc.call(item)
        end
        return true
    end

    def my_flatten
        flattened = []

        self.my_each do |el|
        if el.is_a?(Array)
            flattened.concat(el.my_flatten)
        else
            flattened << el
        end
        end

        flattened
    end

    def my_zip(*arrs)
        new = []
        self.each.with_index do |el,i|
            new[i] = Array.new
            new[i] << el
            arrs.each do |arr|
                new[i] << arr[i] if arr[i] != nil
                new[i] << nil if arr[i] == nil
            end
        end
        new
    end

    def my_rotate(distance=1)
        temp = Array.new(self)
        if distance>=1
            distance.times do
                temp.push(temp.shift)
            end
        elsif distance == 0
            temp
        elsif distance < 0
            distance.abs.times {temp.unshift(temp.pop)}
        end
        temp
    end

    def my_join(separator="")
        word = ""
        self.each_with_index do |letter,i|
            word += letter
            word += separator if self[i+1] != nil
        end
        word
    end
    
    def my_reverse
        arr = []
        i = self.length-1
        while i >= 0
            arr << self[i]
            i -= 1
        end
        arr
    end
end

p [1,2,3,4,5,6,7,8,9,10].factors(6)