require "./board"
require "./human_player"

class Game
    attr_reader :players, :current_player
    attr_writer :players, :current_player
    def initialize(*pmarks,n)
        @players = []
        pmarks.each do |mark|
            @players << HumanPlayer.new(mark)
        end
        @current_player = @players[0]
        @board = Board.new(n)
    end

    def switch_turn
        @players.unshift(@players.pop)
        @current_player = @players[0]
    end

    def play
        won = false
        while @board.empty_positions? && won == false
            @board.print
            pos = @current_player.get_position
            while !@board.valid(pos[0],pos[1]) && !@board.empty?(pos[0],pos[1])
                pos = @current_player.get_position
            end
            @board.place_mark(pos[0],pos[1],@current_player.mark)
            if @board.win?(@current_player.mark)
                p "victory"
                won = true
                return @board.print
            else
                self.switch_turn
            end
        end
        return "draw"
    end
end

game = Game.new(:X, :O, :Z, 6)

game.play