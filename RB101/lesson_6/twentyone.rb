require 'pry'
VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
SUITS = %w(hearts diamonds clubs spades)
TOURNAMENT_MAX = 5
PLAYER_MAX = 21
DEALER_MAX = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(gamecards)
  values = gamecards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    if value == "ace"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  values.select { |value| value == "ace" }.count.times do
    sum -= 10 if sum > PLAYER_MAX
  end
  sum
end

def display_cards(hand)
  string = ''
  hand.each do |element|
    string << "#{element[1]}, "
  end
  string.slice(0..-3)
end

def busted?(cards)
  total(cards) > PLAYER_MAX
end

def dealer_result(cards)
  if !!busted?(cards)
    prompt "Dealer's a bust. You win."
  end
end

def player_result(cards)
  if !!busted?(cards)
    prompt "You're a bust. Dealer wins."
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  system "clear"
  answer.downcase.start_with?('y')
end

def wait_btwn_rounds
  prompt "Starting new game in 5..."
  Kernel.sleep(1)
  prompt "Starting new game in 4..."
  Kernel.sleep(1)
  prompt "Starting new game in 3..."
  Kernel.sleep(1)
  prompt "Starting new game in 2..."
  Kernel.sleep(1)
  prompt "Starting new game in 1..."
  Kernel.sleep(1)
end

def ask_player?
  puts "---------------------"
  prompt "Player, hit or stay?"
  player_answer = gets.chomp
 # player_answer == "hit"  
end

player_wins = 0
dealer_wins = 0

loop do

  prompt "Welcome to Twenty One!"
  prompt "This tournament is best of five games."
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  puts "---------------------"
  prompt "You have #{player_cards[0][1]} of #{player_cards[0][0]}."
  prompt "You have #{player_cards[1][1]} of #{player_cards[1][0]}."
  prompt "Dealer has #{dealer_cards[0][1]} of #{dealer_cards[0][0]} and unknown card."

  dealer_total = total(dealer_cards)
  player_total = total(player_cards)

  loop do
    player_answer = ''
    loop do
      player_answer = ask_player?
      break if player_answer == "hit" || player_answer == "stay"
      prompt "Please enter a correct option: hit or stay."
    end
    system "clear"
    if player_answer == "hit"
      player_cards << deck.pop
      prompt "You now have #{display_cards(player_cards)}."
    end
    break if busted?(player_cards) || player_answer == "stay"
  end

  if busted?(player_cards)
    player_result(player_cards)
    dealer_wins += 1
  else
    player_total = total(player_cards)
    prompt "You stayed at #{player_total}"
  end

  loop do
    if !busted?(player_cards)
      prompt "Dealer will play now..."
      Kernel.sleep(1)
      dealer_cards << deck.pop
      prompt "Dealer has #{display_cards(dealer_cards)}."
      if busted?(dealer_cards)
        player_wins += 1
        dealer_result(dealer_cards)
      else
        dealer_total = total(dealer_cards)
        prompt "Dealer stayed at #{dealer_total}"
      end
      break if busted?(dealer_cards) 
    end
    break if busted?(player_cards)
  end

  dealer_total = total(dealer_cards)
  player_total = total(player_cards)

  puts "--------------"
  prompt "Player's tournament score is #{player_wins}"
  prompt "Dealer's tournament score is #{dealer_wins}"
  puts "------------------"
  prompt "You had #{display_cards(player_cards)} equal to #{player_total}"
  prompt "Dealer had #{display_cards(dealer_cards)} equal to #{dealer_total}"

  prompt "Press enter to start a new round."
  answer = gets.chomp
  wait_btwn_rounds

    if player_wins == TOURNAMENT_MAX || dealer_wins == TOURNAMENT_MAX
    prompt "#{TOURNAMENT_MAX} wins. Game over."
    # player_wins = 0
    # dealer_wins = 0
    break unless play_again?
  end
  system "clear"

end

prompt "Thank you for playing Twenty One! Good bye."
