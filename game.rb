module Tictactoe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}, enter 1-9 to make a move"
    end

    def get_move(player_move = gets.chomp)
      player_move_to_coordinate(player_move)
    end

    def player_move_to_coordinate(player_move)
      mapping = { '1' => [0, 0],
                  '2' => [1, 0],
                  '3' => [2, 0],
                  '4' => [0, 1],
                  '5' => [1, 1],
                  '6' => [2, 1],
                  '7' => [0, 2],
                  '8' => [1, 2],
                  '9' => [2, 2]
                }
      mapping[player_move]
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "Tie!" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} makes the first move."
      while true
        board.formatted_grid
        puts ''
        puts solicit_move
        x, y = get_move
        board.set_cell(x, y, current_player.symbol)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end
  end
end