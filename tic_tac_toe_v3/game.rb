require "./board"
require "./human_player"
require "./computer"

class Game
    attr_reader :players, :current_player
    attr_writer :players, :current_player
    attr_accessor :board
    def initialize(hash,n)
        @players = []
        hash.each do |k,v|
            @players << HumanPlayer.new(k) if v == false
            @players << Computer.new(k) if v == true
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
            puts
            @board.print
            if @current_player.is_a?(HumanPlayer)
                pos = @current_player.get_position
                while !@board.possible.include?([pos[0],pos[1]])
                    p "Enter a correct position moron"
                    pos = @current_player.get_position
                end
                @board.remove(pos[0],pos[1])
            else
                p @board.legal_positions
                pos = @current_player.get_position(@board)
                @board.remove(pos[0],pos[1])
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
        p "draw"
        @board.print
    end
end

game = Game.new({:O => true, :X => true}, 5)

game.play