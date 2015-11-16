# sudo code:
# conditions: rock > scissors, paper > rock, scissors > paper, and tie.
# player one choose an action (r/p/s)
# computer choose an action randomly (r/p/s)
# compare
# ask if playing again

puts "Hi, it's a Tiny Paper, Rock, Scissors game."

loop do

  puts "P for Paper, R for Rock, S for Scissors, please pick one:"

  player_pick = gets.chomp
  if player_pick.capitalize != "P" && player_pick.capitalize != "R" && player_pick.capitalize != "S"
    loop do
      puts "You have to pick among P, R, and S"
      player_pick = gets.chomp
      break if player_pick.capitalize == "P" || player_pick.capitalize == "R" || player_pick.capitalize == "S"
    end
  end

  computer_pick = ["P", "R", "S"].sample

  if player_pick.capitalize == "R" && computer_pick == "S"
    puts "You pick Rock and computer picks Scissocrs, you win."
  elsif player_pick.capitalize == "P" && computer_pick == "R"
    puts "You pick Paper and computer picks Rock, you win."
  elsif player_pick.capitalize == "S" && computer_pick == "P"
    puts "You pick Scissors and computer picks Paper, you win."
  elsif player_pick.capitalize == "P" && computer_pick == "S"
    puts "You pick Paper and computer picks Scissocrs, computer wins."
  elsif player_pick.capitalize == "R" && computer_pick == "P"
    puts "You pick Rock and computer picks Paper, computer wins."
  elsif player_pick.capitalize == "S" && computer_pick == "R"
    puts "You pick Scissors and computer picks Rock, computer wins."
  else
    puts "It's a tie."
  end

  puts "Would you like to play again?(y/n)"
  play_again = gets.chomp
  break if play_again.capitalize == "N"
end
