# DECK = {one: "1", two: "2", three: "3", four: "4", five: "5",
#         six: "6", seven: "7", eight: "8", nine: "9", ten: "10",
#         jack: "0", queen: "0", king: "0", ace: "0"}
DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
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
    if value == "ace"
      sum += 11
    elsif value == "jack" || value == "king" || value == "queen"
      sum += 10
    else
      sum += value.to_i
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
total(dealer_cards)

# ask player if it would like to hit or stay
# if hit and sum is over 21 - bust
# if hit and sum is less than 21 goes back to hit

# player turn
def player_turn
  loop do
    prompt "hit or stay?"
    answer = gets.chomp
    if answer == "hit"
      player_cards << DECK.sample(1) + suits.sample(1)
      puts "Your cards are now #{player_cards} and the sum is #{total(player_cards)}"
      if total(player_cards) > 21
        prompt "Game over."
        break
      end
    elsif answer == "stay"
        break
    end
  end
end

player_turn

# # dealer turn
# loop do
#   break if answer == "stay" || busted?
#   prompt "hit or stay?"
#   answer = gets.chomp
# end


# if total(cards) > 21
#   prompt "busted"
# end
