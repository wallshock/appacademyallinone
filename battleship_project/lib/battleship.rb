require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2.0
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0 
            print 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        return true if win? || lose?
        return false
    end

    def turn
        @board.print
        if @board.attack(@player.get_move)
            puts @remaining_misses
        else
            @remaining_misses -= 1
            puts @remaining_misses
        end
    end
end
