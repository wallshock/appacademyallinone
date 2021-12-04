class Board
    attr_reader :grid
    attr_writer :grid
    attr_accessor :possible

    def initialize(n=3)
        @grid = Array.new(n) {Array.new(n, "_")}
        @possible = []
    end


    def valid(pos1,pos2)
        return true if @grid[pos1][pos2] != nil
        p  "incorrect position"
        p pos1, pos2
        return false
    end

    def empty?(pos1,pos2)
        if valid(pos1,pos2)    
            return true if @grid[pos1][pos2] == "_"
            p "position already chosen"
            return false
        end
        return false
    end

    def place_mark(pos1,pos2,mark)
        if valid(pos1,pos2) && empty?(pos1,pos2)
            @grid[pos1][pos2] = mark
        else
            raise ArgumentError
        end
    end
    
    def print
        self.grid.each do |row|
            p row
            puts
        end
    end
    
    def all_equal?(arr)
        arr.uniq.size <= 1
    end
    
    def win_row?(mark)
        same = false
        @grid.each do |array|
        same = true if all_equal?(array) && array.uniq[0] == mark
        end
        same
    end

    def win_column?(mark)
        temp = nil
        symbol = "" 
        @grid.each do |array|
            if temp == nil
                temp = Array.new(array) 
            else
                array.each.with_index do |char, i|
                    if temp.include?(char) && temp.index(char) == i
                        count = 0
                        symbol = char
                        (0...@grid.length).each do |j|
                            count += 1 if @grid[j][i] == char
                            break if @grid[j][i] != char
                        end
                    return true if count == @grid.length && symbol == mark
                    end
                end
                return false
            end
        end
    end

    def win_diagonal?(mark)
        count = 0
        i = @grid.length-1
        same = true
        if @grid[0][0] == @grid[-1][-1] 
            while i>=0
                if @grid[i][i] != @grid[0][0]
                    break
                else
                    count += 1
                end
                i -= 1
            end
            return true if count == @grid.length && @grid[0][0] == mark
        end
    
        if @grid[0][-1] == @grid[-1][0]
            j = 0
            l = @grid.length-1
            while j < l
                if @grid[j][l-j] != @grid[0][-1]
                    break
                else
                    count += 1
                end
                j += 1
            end
            return true if count == @grid.length  && mark == @grid[0][-1]
        end
    
        
        return false
    end

    def win?(mark)
        return true if win_row?(mark) || win_column?(mark) || win_diagonal?(mark)
        return false
    end

    def empty_positions?
        self.grid.each do |arrs|
            arrs.each do |pos|
                return true if pos == "_"
            end
        end
        return false
    end

    def legal_positions
        if @possible.empty?
        @grid.each.with_index do |row,i|
            row.each.with_index do |c,j|
            @possible << [i,j]
            end
        end
        end
        return @possible
    end

    def remove(pos1,pos2)
        @possible.delete([pos1,pos2])
    end


end








