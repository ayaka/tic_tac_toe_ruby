require_relative "player.rb"
require_relative "game.rb"

def get_player_name(letter)
    puts "Player #{letter}, please enter your name"
    return gets.chomp
end

player_a = Player.new(get_player_name("A"), "O")
player_b = Player.new(get_player_name("B"), "X")

game = Game.new(player_a, player_b)
game.play