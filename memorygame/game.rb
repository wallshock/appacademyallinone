require 'colorize'
require './card'
require './Human'
require './board'
require './AI'

class Game
    attr_accessor :board
    attr_reader :player
    def initialize(player)
        @board = nil
        @guesses = []
        @tempcards = []
        @player = player
        @chances = 15
    end
    
    def reducechances
        @chances -= 1 
    end
    
    def ended
        if @chances > 0
        @board.grid.each do |row|
            row.any? do |el| 
            if el.instance_of? Card
                if el.side == false
                    return false
                end
            end
        end
        end
    end
        return true
    end


    def run
        self.start
        while !self.ended

            @board.render
            print "Enter a guess:"
            guess = player.getguess
            print guess
            
            while !valid?(guess)
                print "Enter a correct guess:"
                guess = player.getguess
            end
            player.receive_card(guess,board.grid[guess[0]][guess[1]].symbol) if !player.memory.include?(guess)
            board.grid[guess[0]][guess[1]].reveal
            
            @board.render
            sleep(1)
            @guesses << board.grid[guess[0]][guess[1]].symbol
            @tempcards << board.grid[guess[0]][guess[1]]
            if @guesses.size == 2
                if @guesses.uniq.size == 1
                    puts "You guessed it!"
                    sleep(1)
                    player.clearmemory(board.grid[guess[0]][guess[1]].symbol)
                    player.clearpicks
                    @guesses.clear
                    @tempcards.clear
                else
                    puts "Wrong Pair"
                    self.reducechances
                    puts "Chances remaining: " + @chances.to_s
                    sleep(1)
                    @tempcards.each do |guess|
                        guess.hide
                    end
                    @guesses.clear
                    @tempcards.clear
                end
            end
            
        end
        if @chances > 0
            puts "Congrats, you won!!!"
            return 0;
        end
        puts "You Lost"

    end

    def valid?(guess)
        if guess.size != 2
            return false
        elsif !guess.all? {|el| el.instance_of? Integer}
            return false
        else
            return true
        end
    end

    def firstprompt(size)
        @board = Board.new(size)
        @board.render
        @board.createcards
        @board.populate
        @board.show
        sleep(3)
        system("clear")
    end

    def start
        print "Choose a size of your game: "
        size = player.getsize
        while !size.even?
            puts "Choose an even number "
            print "Choose a size again: "
            size = gets.chomp.to_i
        end
        firstprompt(size)
    end
end

if __FILE__ == $PROGRAM_NAME
gra = Game.new(AI.new)
gra.run
end