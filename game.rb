require_relative "board.rb"

class Game
    attr_reader :board, :players
    def initialize(player_a, player_b)
        @players = select_first_player([player_a, player_b])
        @board = Board.new(3, 3)
    end

    def play
        announce_first_player(players[0])
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

    def select_first_player(players)
        return players.shuffle
    end

    def announce_first_player(player)
        puts "The game randomly picked #{player.name} as the first player"
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

