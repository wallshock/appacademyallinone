class Board
    attr_reader :size
    
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos,v)
        row, col = pos
        @grid[row][col] = v
    end

    def num_ships
        ships = 0 
        @grid.each do |array|
            ships += array.count(:S)
        end
        return ships
    end

    def attack(pos)
        if self[pos] == :S
            puts 'you sunk my battleship'
            self[pos] = :H
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        total_s = @size / 4.0
        while self.num_ships < total_s
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row,col]
            self[pos]= :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
