# sudo code:
# conditions: rock > scissors, paper > rock, scissors > paper, and tie.
# player one choose an action (r/p/s)
# computer choose an action randomly (r/p/s)
# compare
# ask if playing again


CHOICES = {"p" => "Paper", "r"=>"Rock", "s"=>"Scissors"}
puts "Hi, it's a Tiny Paper, Rock, Scissors game."

def display_winning_message(winning_choice)
  case winning_choice
  when "r"
    puts "Rock smashes scissors."
  when "s"
    puts "Scissors cuts Paper."
  when "p"
    puts "Paper wraps rock."
  end
end

loop do
  begin
    puts "P for Paper, R for Rock, S for Scissors, please pick one:"
    player_pick = gets.chomp.downcase
  end until CHOICES.keys.include?(player_pick)

  computer_pick = CHOICES.keys.sample

  if player_pick == computer_pick
    puts "It's a tie."
  elsif (player_pick == "r" && computer_pick == "s") || (player_pick == "p" && computer_pick == "r") || (player_pick == "s" && computer_pick == "p")
    display_winning_message(player_pick)
    puts "You won."
  else
    display_winning_message(computer_pick)
    puts "Computer wins."
  end

  puts "Would you like to play again?(y/n)"
  break if gets.chomp.downcase != "y"
end

puts "See you soon~"
