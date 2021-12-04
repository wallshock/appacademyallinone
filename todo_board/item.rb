class Item
    attr_accessor :title, :deadline, :description, :done
    
    def self.valid_date?(date)
        arr = date.split("-")
        return false if arr[1].to_i < 1 || arr[1].to_i > 12 
        return false if arr[2].to_i < 1 || arr[2].to_i > 31 
        return true
    end
    
    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise ArgumentError
        end
        @description = description
        @done = false
    end

    def toggle
        @done = !@done
    end

    def status
        return "done" if @done
        return "not done" if !@done
    end

    def title=(t)
        @title = t
    end

    def deadline=(newdate)
        if Item.valid_date?(newdate)
            @deadline = newdate
        else
            raise ArgumentError
        end
    end

    def description=(desc)
        @description = desc
    end
end

