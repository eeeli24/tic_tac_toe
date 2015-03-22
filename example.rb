require_relative 'cell'
require_relative 'board'
require_relative 'game'
require_relative 'player'
require_relative 'monkey_patch'

puts 'Tic Tac Toe'
bob = Tictactoe::Player.new({symbol: 'X', name: 'bob'})
frank = Tictactoe::Player.new({symbol: 'O', name: 'frank'})
players = [bob, frank]
Tictactoe::Game.new(players).play