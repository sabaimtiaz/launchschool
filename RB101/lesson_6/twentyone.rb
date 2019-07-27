
DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
suits = %w[hearts diamonds clubs spades]
num_of_cards = 52


def prompt(msg)
  puts "=> #{msg}"
end

def generate(gamecards)
  cards = []
  2.times do
    cards << DECK.sample(1) + suits.sample(1)
  end
end

def total(gamecards)
  values = gamecards.map { |card| card[0] }
  sum = 0
  values.each do |value|
    if value == "jack" || value == "king" || value == "queen"
      sum += 10 if sum != 21
    else
      sum += value.to_i
    end
    if value == "ace" && sum >= 20
      sum += 1
    elsif 
      value == "ace" && sum < 20
        sum += 11 if sum != 21
      end
  end
  sum
end

prompt "Welcome to Twenty One!"

# deal cards
player_cards = []
  2.times do
    player_cards << DECK.sample(1) + suits.sample(1) 
  end
player_cards
prompt "You have #{player_cards} and the total is #{total(player_cards)}"

dealer_cards = []
  2.times do
    dealer_cards << DECK.sample(1) + suits.sample(1) 
  end
dealer_cards
prompt "Dealer has #{dealer_cards.sample(1)}"

def player_busted?(cards)
   total(cards) >= 21 
end

def dealer_busted?(cards)
  total(cards) == 17
end

loop do
    prompt "Player, hit or stay?"
    player_answer = gets.chomp
    if player_answer == "hit"
      player_cards << DECK.sample(1) + suits.sample(1)
      prompt "Your cards are now #{player_cards} and the sum is #{total(player_cards)}"
      if !!player_busted?(player_cards)
        prompt "Player's a bust. Dealer wins."
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
      if !!dealer_busted?(dealer_cards)
        prompt "Dealer's a bust. Player wins"
        break
      end
    elsif dealer_answer == "stay"
      prompt "Dealer stays"
      break
    elsif dealer_answer == "stay" && player_answer == "stay"
      if total(player_cards) > total(dealer_cards)
        prompt "Player wins because its total #{total(player_cards)} is greater than dealer's total"
      else
        prompt "Dealer wins"
        break
      end
    end
  end
  break if player_cards.length + dealer_cards.length == 52
end