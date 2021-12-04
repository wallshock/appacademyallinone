require 'colorize'
require './card'

class Board
    attr_accessor :cards
    attr_reader :size, :grid
    def initialize(size)
        @size = size
        @grid = Array.new(@size+1) {Array.new(@size+1) {0}}
        @cards = []
    end

    def hud
        @grid.each.with_index do |row,i|
            row.each.with_index do |col, j|
                @grid[i][j] = nil if i == 0 && j == 0
                @grid[i][j] = j if i == 0 && j != 0 
                @grid[i][j] = i if i != 0 && j == 0
            end
        end       
    end
    def symbolinclude?(symbol)
        @cards.each do |card|
            return true if card.symbol == symbol
        end
        return false
    end
    def createcards
        while @cards.size < (@size*@size)/2
            temp = ("A".."Z").to_a.sample
            @cards << Card.new(temp) if !self.symbolinclude?(temp)
        end
        dup = []
        @cards.each do |card|
            dup << Card.new(card.symbol)
        end
        @cards.push(dup)
        @cards.flatten!.shuffle
    end

    def populate
        @grid.each.with_index do |row,i|
            row.each.with_index do |col, j|
                @grid[i][j] = @cards.delete(@cards.sample) if @grid[i][j] == 0
            end
        end   
    end
    
    def render
        system("clear")
        puts self.hud.map { |a| a.map { |i| 
            if !i.instance_of? Card
                i.to_s.rjust(3)
            elsif i.side
                i.symbol.to_s.rjust(3).red
            else
                "X".rjust(3)
            end
        }.join }
    end

    def show
        system("clear")
        puts self.hud.map { |a| a.map { |i| 
            if !i.instance_of? Card
                i.to_s.rjust(3)
            else
                i.symbol.to_s.rjust(3)
            end
        }.join }
    end
end
