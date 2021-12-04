class HumanPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position
        nums = "0123456789" 
        p "Enter a row (0,1,2)"
        pos1 = gets.chomp
        p "Enter a column (0,1,2)"
        pos2 = gets.chomp
        if nums.include?(pos1) && nums.include?(pos2)
            return pos1.to_i, pos2.to_i
        else raise ArgumentError
        end 
    end
end

player = HumanPlayer.new(:X)
