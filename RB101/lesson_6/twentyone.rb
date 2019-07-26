# DECK = {one: "1", two: "2", three: "3", four: "4", five: "5",
#         six: "6", seven: "7", eight: "8", nine: "9", ten: "10",
#         jack: "0", queen: "0", king: "0", ace: "0"}
require 'pry'
# DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
DECK = [5, 5, "ace"]
suits = %w[hearts diamonds clubs spades]
num_of_cards = 52


def prompt(msg)
  puts "=> #{msg}"
end

cards = []
2.times do
  cards << DECK.sample(1) + suits.sample(1)
end

def total(cards)
  values = cards.map { |card| card[0] }
  sum = 0
  values.each do |value|
    if value == "jack" || value == "king" || value == "queen"
      sum += 10
    else
      sum += value.to_i
    end
    if value == "ace" && sum >= 20
      sum += 1
    elsif 
      value == "ace" && sum < 20
        sum += 11
      end
  end
  sum
end
total(cards)

#  gameplay
# initialise game
prompt "Welcome to Twenty One!"

# deal cards
player_cards = []
  2.times do
    player_cards << DECK.sample(1) + suits.sample(1)
  end
player_cards
prompt "You have #{player_cards} and the sum is #{total(player_cards)}"

dealer_cards = []
  2.times do
    dealer_cards << DECK.sample(1) + suits.sample(1)
  end
dealer_cards
prompt "Dealer has #{dealer_cards} and the sum is #{total(dealer_cards)}"

# break if player_cards.length + dealer_cards.length >= 52

# player turn

loop do
    prompt "Player, hit or stay?"
    player_answer = gets.chomp
    if player_answer == "hit"
      player_cards << DECK.sample(1) + suits.sample(1)
      prompt "Your cards are now #{player_cards} and the sum is #{total(player_cards)}"
   #   prompt "The dealer's cards are #{dealer_cards.sample(1)}"
      if total(player_cards) >= 21
        prompt "Game over."
        break
      end
    elsif player_answer == "stay"
      prompt "It's time for the dealer to play"
    end
  loop do
      prompt "Dealer, hit or stay?"
      dealer_answer = gets.chomp
      if dealer_answer == "hit"
        dealer_cards << DECK.sample(1) + suits.sample(1)
        prompt "The dealer's cards are #{dealer_cards} and the sum is #{total(dealer_cards)}"
        if total(dealer_cards) >= 17
          prompt "Game over. Player wins"
          break
        end
        break
      elsif dealer_answer == "stay"
        prompt "Dealer stays"
        break
      end
    end
  break if player_cards.length + dealer_cards.length == 52
end