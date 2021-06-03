class Board
    attr_reader :grid
    def initialize(row, column)
        @row = row
        @column = column
        @grid = create_board(row, column)
    end

    def create_board(row, column)
        Array.new(row) { |i| Array.new(column) { |j| i * column + j + 1} }
    end

    def mark(num, marker)
        row, column = grid_position(num)
        grid[row][column] = marker
    end

    def win?(marker)
        return true if row_complete?(marker) || column_complete?(marker) || diagonal_complete?(marker)
        false
    end

    def tie?
        return false if grid.flatten.any?(Numeric)
        true
    end

    def display_board
        puts
        grid.length.times do |i|
            p grid[i]
        end
        puts
    end

    private

    def grid_position(num)
        row = (num-1) / @row
        column = (num-1) % @row
        [row, column]
    end

    def selection(num)
        row, column = grid_position(num)
        grid[row][column]
    end

    def valid?(row, column)
        grid[row][column].nil?
    end

    def row_complete?(marker)
        grid.length.times { |i| return true if grid[i].all?(marker) }
        false
    end

    def column_complete?(marker)
        new_grid = grid.transpose
        new_grid.length.times { |i| return true if new_grid[i].all?(marker) }
        false
    end

    def diagonal_complete?(marker)
        return true if selection(1) == marker && selection(5) == marker && selection(9) == marker
        return true if selection(3) == marker && selection(5) == marker && selection(7) == marker
        false
    end
end


