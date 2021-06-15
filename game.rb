require_relative "board.rb"

class Game
    attr_reader :board, :players
    def initialize
        @players = []
        set_players
        @board = Board.new(3, 3)
    end

    def play
        while true
            board.display_board
            selection = get_selection(players[0])
            board.mark(selection, players[0].marker)
            if board.win?(players[0].marker)
                announce_winner(players[0])
                board.display_board
                exit
            elsif board.tie?
                announce_tie
                board.display_board
                exit
            else
                switch_players
            end
        end
    end

    private

    def set_players
        names = []
        "A".upto("B") { |l| names.push(get_player_name(l)) }
        order(names)

    end

    def get_player_name(letter)
        puts "Player #{letter}, please enter your name"
        return gets.chomp
    end

    def order(names)
        names.shuffle!
        players << Player.new(names[0], "O")
        players << Player.new(names[1], "X")
        announce_players
    end

    def announce_players
        puts "The game randomly picked #{players[0].name} as the first player"
        0.upto(1) { |i| players[i].introduce }
    end

    def get_selection(player)
        puts "#{player.name}, enter number where you want to mark"
        while true
            selection = gets.chomp
            return selection.to_i if valid_input?(selection)
            puts "Please enter a valid number"
        end
    end

    def valid_input?(selection)
        /^[1-9]$/.match?(selection)
    end
        
    def announce_winner(player)
        puts "#{player.name} wins!"
    end

    def announce_tie
        puts "The game ends in tie..."
    end

    def switch_players
        temp = players[0]
        players[0] = players[1]
        players[1] = temp
    end
end

