=begin
sudo code:

- We need a deck of cards
- Then shuffle cards
- Bet
- Each of player and dealer is given one card, then second card. Dealer's first card is hidden.
- Check if player hits blackjack
- If no blackjack, player starts to choose "hit" or "stay".
- Check if player gets busted.
- If no, keeps choosing "hit" or "stay".
- After player chooses to stay, now it comes to dealer's turn.
- Check dealer's cards and see if dealer hits blackjack.
- Dealer must has at least 17, once reach 17, stop.
- Check dealer cards to see if hitting blackjack or getting busted.
- If neither busted nor hitting blackjack, compare player's and dealer's total value.
- When deck.count is less than a specific number, start a new deck.
=end

def initialize_deck
  suits = ["Spade", "Heart", "Diamond", "Club"]
  cards = (2..10).collect {|n| n.to_s } + ["J", "Q", "K", "A"]
  suits.product(cards)
  # How to combine two arrays into one hash? e.g. {"spade" => "A"}
end

def shuffle_cards(deck)
  deck.shuffle!
end

def calculate_total(cards)
  cards_values = cards.map {|a| a[1] }
  total = 0

  cards_values.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  cards_values.select {|a| a == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

def compare(player_total, dealer_total)
  if player_total > dealer_total
    puts "You have #{player_total} and dealer has #{dealer_total}, you win."
  elsif player_total == dealer_total
    puts "It's a tie."
  else
    puts "You have #{player_total} and dealer has #{dealer_total}, you lose."
  end
  exit
end

puts ""
puts "Welcome to Blackjack."
puts ""

deck = initialize_deck
player_cards = []
dealer_cards = []
shuffle_cards(deck)
2.times do
  player_cards << deck.pop
  dealer_cards << deck.pop
end
player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)
puts "Dealer's first card is unshown, dealer's second card is #{dealer_cards[1]}."
puts "Your cards are #{player_cards[0]} & #{player_cards[1]}."
if player_total == 21
  puts "Congratulations! You hit Blackjack! You win!!!"
  exit
end
while player_total < 21
  puts "What would you like to do? 1)hit 2)stay"
  hit_or_stay = gets.chomp
  if !["1", "2"].include?(hit_or_stay)
    puts "You must input 1 or 2."
    next
  end
  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end
  new_card = deck.pop
  puts "Your new card is #{new_card}."
  player_cards << new_card
  player_total = calculate_total(player_cards)
  puts "Your total is #{player_total}"
  if player_total == 21
    puts "Congratulations! You hit Blackjack! You win!"
    exit
  elsif player_total > 21
    puts "Sorry, you busted..."
    exit
  end
end
if dealer_total == 21
  puts "Sorry, dealer hits blackjack, you lose."
  exit
end
while dealer_total < 17
  new_card = deck.pop
  puts "Dealer's new card is #{new_card}."
  dealer_cards << new_card
  dealer_total = calculate_total(dealer_cards)
  if dealer_total == 21
    puts "Sorry, dealer hits blackjack, you lose."
    exit
  elsif dealer_total > 21
    puts "Dealer busted, you win."
    exit
  end
end
compare(player_total, dealer_total)
