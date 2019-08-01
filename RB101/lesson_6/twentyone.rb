DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
SUITS = %w(hearts diamonds clubs spades)

def prompt(msg)
  puts "=> #{msg}"
end

def generate(cards)
  cards = []
  cards << DECK.sample(1) + SUITS.sample(1)
  cards << DECK.sample(1) + SUITS.sample(1)
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
    elsif value == "ace" && sum < 20
      sum += 11 if sum != 21
    end
  end
  sum
end

prompt "Welcome to Twenty One!"

player_cards = []
player_cards = generate(player_cards)
prompt "You have #{player_cards} and the total is #{total(player_cards)}"

dealer_cards = []
dealer_cards = generate(dealer_cards)
prompt "Dealer has #{dealer_cards.sample(1)}"

def player_busted?(cards)
  total(cards) >= 21
end

def dealer_busted?(cards)
  total(cards) >= 17
end

loop do
  prompt "Player, hit or stay?"
  player_answer = gets.chomp
  if player_answer == "hit"
    player_cards << DECK.sample(1) + SUITS.sample(1)
    prompt "You now have #{player_cards} equal to #{total(player_cards)}"
    if !!player_busted?(player_cards)
      prompt "Player's a bust. Dealer wins."
      break
    end
  elsif player_answer == "stay"
    prompt "Dealer, hit or stay?"
    dealer_answer = gets.chomp
    if dealer_answer == "hit"
      dealer_cards << DECK.sample(1) + SUITS.sample(1)
      if !!dealer_busted?(dealer_cards)
        prompt "Dealer's a bust."
        prompt "Player total #{total(player_cards)} is more than dealer #{total(dealer_cards)}"
        break
      end
    elsif dealer_answer == "stay"
      prompt "Dealer stays"
    end
  end
end
