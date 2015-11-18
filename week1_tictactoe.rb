=begin
sudo code:

draw a board
begin
  player picks an empty square using marker "X"
  check winner
  computer picks an empty square using marker "O"
  check winner
end until there's a winner or all squares are taken

More:
[v] Add all winning conditions
[v] Restrict from choosing occupied squares.
[v] Play again?
[v] First player has advantage, rondomly choose the first player.
[v] Fix the logical problem when checking winner.

- two_in_a_row => How to use this method?
=end

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

def draw_board(b)
  system "clear"
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "---+---+---"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "---+---+---"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = " " }
  b
end

def empty_positions(b)
  b.select {|k, v| v == " " }.keys
end

def player_picks_square(b)
  begin
    puts "Pick a square: (1 - 9)"
    position = gets.chomp.to_i
  end until empty_positions(b).include?(position)
  b[position] = "X"
end

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = "O"
end

def check_winner(b)
  WINNING_LINES.each do |line|
    return "Player" if b.values_at(*line).count("X") == 3
    return "Computer" if b.values_at(*line).count("O") == 3
# return "Player" if b.values_at(*line) == ["X", "X", "X"]
# return "Computer" if b.values_at(*line) == ["O", "O", "O"]
  end
  nil
end

def two_in_a_row(hsh, mrkr)
  if hsh.values.count(mrkr) == 2  # If coding like line 62 & 63, it'll be more complicated.
    hsh.select{|k,v| v == ' '}.keys.first
  else
    false
  end
end


def game_engine
  board = initialize_board
  draw_board(board)
  first_player = ["Player", "Computer"].sample

  if first_player == "Player"
    begin
      player_picks_square(board)
      draw_board(board)
      winner = check_winner(board)
      if winner || empty_positions(board).empty?
        break
      end
      computer_picks_square(board)
      draw_board(board)
      winner = check_winner(board)
    end until winner || empty_positions(board).empty?
  # Even if I win, sometimes program still shows "Computer win."

  elsif first_player == "Computer"
    begin
      computer_picks_square(board)
      draw_board(board)
      winner = check_winner(board)
      if winner || empty_positions(board).empty?
        break
      end
      player_picks_square(board)
      draw_board(board)
      winner = check_winner(board)
    end until winner || empty_positions(board).empty?
  end

  if winner
    puts "#{winner} won!"
  else
    puts "It's a tie."
  end
end


begin
  game_engine
  puts "Play again? (y/n)"
end until gets.chomp.downcase != "y"

puts "See you soon!"
