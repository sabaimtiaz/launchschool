DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
SUITS = %w(hearts diamonds clubs spades)
player_win = 0
dealer_win = 0

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

def format_string(array)
  string = ''
  array.each do |element|
    string << "#{element[0]}, "
  end
  string.slice(0..-3)
end

def player_busted?(cards)
  total(cards) >= 21
end

def dealer_busted?(cards)
  total(cards) >= 17
end

def dealer_result(cards)
  if !!dealer_busted?(cards)
    prompt "Dealer's a bust. Player wins."
    prompt "Dealer had #{format_string(cards)} equal to #{total(cards)}"
  end
end

def player_result(cards)
  if !!player_busted?(cards)
    prompt "Player's a bust. Dealer wins."
    prompt "Player had #{format_string(cards)} equal to #{total(cards)}"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  system "clear"
  answer.downcase.start_with?('y')
end

loop do
  if player_win == 5 || dealer_win == 5
    prompt "Five wins. Game over."
    break
  end

  prompt "Welcome to Twenty One!"
  player_cards = []
  dealer_cards = []
  player_cards = generate(player_cards)
  dealer_cards = generate(dealer_cards)

  prompt "You have #{player_cards[0][0]} and #{player_cards[1][0]}."
  prompt "Dealer has #{dealer_cards[0][0]} and unknown card."

  prompt "Player wins are #{player_win}"
  prompt "Dealer wins are #{dealer_win}"
  dealer_total = total(dealer_cards)
  player_total = total(player_cards)

  loop do
    player_answer = ''
    loop do
      prompt "Player, hit or stay?"
      player_answer = gets.chomp
      break if player_answer == "hit" || player_answer == "stay"
      prompt "Please enter a correct option: hit or stay."
    end
    system "clear"
    if player_answer == "hit"
      player_cards << DECK.sample(1) + SUITS.sample(1)
      prompt "You now have #{format_string(player_cards)}."
    end
    break if player_busted?(player_cards) || player_answer == "stay" 
  end

  if player_busted?(player_cards)
    player_result(player_cards)
    dealer_win += 1
    play_again? ? next : break 
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer will play now..."
  Kernel.sleep(1)
  dealer_cards << DECK.sample(1) + SUITS.sample(1)
  prompt "Dealer has #{format_string(dealer_cards)}."

  if dealer_busted?(dealer_cards)
    player_win += 1
    dealer_result(dealer_cards)
    play_again? ? next : break
  else
    dealer_total = total(dealer_cards)
    prompt "Dealer stayed at #{dealer_total}"
  end
  break unless play_again? 
  system "clear"
end

prompt "Thank you for playing Twenty One! Good bye."
