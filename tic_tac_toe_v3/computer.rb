require "./board"

class Computer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position(board)
        pose = board.legal_positions.sample
        return pose[0], pose[1]
    end
end

player = HumanPlayer.new(:X)
