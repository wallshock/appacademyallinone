$board = Array.new(8) {Array.new(8) {0}}


row = 0
col = 0

def is_valid?(row,col)
    sum = 0
    $board.each do |r|
        sum += r[col]
    end
    return false if sum > 0
    
    n = 1
    sum_upright = 0
    while row-n >= 0 && col+n <= $board.size-1
        sum_upright += $board[row-n][col+n]
        n += 1
        return false if sum_upright > 0
    end
    n = 1
    while row-n >= 0 && col-n >= 0
        sum_upright += $board[row-n][col-n]
        n += 1
        return false if sum_upright > 0
    end
    n = 1
    while row+n <= $board.size-1 && col+n <= $board.size-1
        sum_upright += $board[row+n][col+n]
        n += 1
        return false if sum_upright > 0
    end
    n = 1
    while row+n <= $board.size-1 && col-n>= 0 
        sum_upright += $board[row+n][col-n]
        n += 1
        return false if sum_upright > 0
    end
    return true



end
n = $board.size

def counter(array2d)
    sum = 0
    array2d.each do |row|
        row.each do |col|
            sum += col
        end
    end
    return sum
end

def printer(board)
    board.each do |row|
        p row
    end
end


def solve(row,start=0)
    if $board[-1].index(1) != nil
        return $board
    end
    (start...$board.size).each do |col|
        if is_valid?(row,col)
            $board[row][col] = 1
            solve(row+1,0) if row+1 !=nil
            return $board
        end
    end
    temp = $board[row-1].index(1)
    $board[row-1][temp] = 0
    solve(row-1,temp+1)
end

solve(row)

printer($board)

