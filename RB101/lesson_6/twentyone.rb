VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
SUITS = %w(hearts diamonds clubs spades)
MOVES = [["hit", "h"], ["s", "stay"]]
PLAY_AGAIN_MOVES = ["yes", "no"]
TOURNAMENT_MAX = 2
PLAYER_MAX = 21
DEALER_MAX = 17

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  system "clear"
  prompt "Welcome to Twenty One!"
  prompt "This tournament is the best of five games."
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def hand_total(gamecards)
  values = gamecards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    if value.to_s == "ace"
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

def generate_hand(hand)
  deck = initialize_deck
  hand = []
  hand << deck.pop
  hand << deck.pop
end

def display_opening(player_cards, dealer_cards)
  puts "---------------------"
  prompt "You have #{display_cards(player_cards)}"
  prompt "Dealer has #{dealer_cards[0][1]} of #{dealer_cards[0][0]}."
  prompt "Dealer has an unknown card."
end

def display_hand(player_cards, dealer_cards)
  dealer_hand_total = hand_total(dealer_cards)
  player_hand_total = hand_total(player_cards)
  puts "------------------"
  prompt "You had #{display_cards(player_cards)}"
  prompt "Your cards are equal to #{player_hand_total}"
  prompt "Dealer had #{display_cards(dealer_cards)}"
  prompt "Dealer's cards are equal to #{dealer_hand_total}"
  puts "------------------"
end

def display_cards(hand)
  string = ''
  hand.each do |element|
    string << "#{element[1]} of #{element[0]}, "
  end
  string.slice(0..-3)
end

def ask_player
  puts "---------------------"
  prompt "Player, hit or stay?"
  gets.chomp.to_s
end

def validate_player_answer?(player_answer)
   MOVES.flatten.include?(player_answer)
end

def error_msg(answer)
  if !validate_player_answer?(answer)
    prompt "Wrong answer. Enter (h)it or (s)tay"
  end
end

def display_stay(cards)
  hand_total(cards)
  prompt "Stayed at #{hand_total(cards)}"
end

def display_dealer
  prompt "Dealer will play now..."
  Kernel.sleep(1)
end

def busted?(cards)
  hand_total(cards) > PLAYER_MAX
end

def dealer_reach_max?(cards)
  hand_total(cards) > DEALER_MAX
end

def player_turn(player_answer, player_cards)
  deck = initialize_deck
  if MOVES[0].flatten.include?(player_answer)
    player_cards << deck.pop
    system "clear"
    prompt "You now have #{display_cards(player_cards)}."
  elsif !MOVES.flatten.include?(player_answer)
    error_msg(player_answer)
  end
end

def player_busts_or_stays(player_cards)
  if busted?(player_cards)
    prompt "You're a bust. Dealer wins."
  else
    system "clear"
    display_stay(player_cards)
  end
end

def dealer_turn(dealer_cards)
  deck = initialize_deck
  display_dealer
  dealer_cards << deck.pop
  prompt "Dealer has #{display_cards(dealer_cards)}."
end

def dealer_busts_or_stays(dealer_cards)
  if busted?(dealer_cards)
    prompt "Dealer's a bust. Player wins."
  elsif dealer_reach_max?(dealer_cards)
    display_stay(dealer_cards)
  end
end

def win?(player, opponent)
  busted?(opponent) ||
    !busted?(player) && (hand_total(player) > hand_total(opponent))
end

def update_score(player, opponent, score)
  if win?(player, opponent)
    score += 1
  end
  score
end

def display_score(player, dealer)
  puts "------------------"
  prompt "Your tournament score is #{player}"
  prompt "Dealer's tournament score is #{dealer}"
  puts "-------------------"
end

def display_winner(p_cards, d_cards)
  if win?(p_cards, d_cards)
    prompt "You won!"
  elsif win?(d_cards, p_cards) && !display_tie(p_cards, d_cards)
    prompt "Dealer won!"
  end
end

def display_tie(p_cards, d_cards)
  prompt "It's a tie!" if hand_total(p_cards) == hand_total(d_cards)
end

def display_result(p_cards, d_cards)
  prompt "Here's the result:"
  display_tie(p_cards, d_cards)
  display_winner(p_cards, d_cards)
end

def tournament_max_reached?(player_score, dealer_score)
  player_score == TOURNAMENT_MAX || dealer_score == TOURNAMENT_MAX
end


def display_game_over(player_score, dealer_score)
  if tournament_max_reached?(player_score, dealer_score)
    prompt "#{TOURNAMENT_MAX} wins. Game over."
  end
end

def play_again
  puts "------------------"
  prompt "Do you want to play another round? (yes or no)"
  gets.chomp.to_s
end

def wait_btwn_rounds
  prompt "Starting new game in 5..."
  Kernel.sleep(1)
  # prompt "Starting new game in 4..."
  # Kernel.sleep(1)
  # prompt "Starting new game in 3..."
  # Kernel.sleep(1)
  # prompt "Starting new game in 2..."
  # Kernel.sleep(1)
  # prompt "Starting new game in 1..."
  # Kernel.sleep(1)
end

def start_new_round
  prompt "Press enter to start a new round."
  gets.chomp
  system "clear"
  wait_btwn_rounds
end

def goodbye
  prompt "Thank you for playing Twenty One!"
  prompt "Good bye."
end

player_score = 0
dealer_score = 0
loop do
  welcome
  player_cards = generate_hand(player_cards)
  dealer_cards = generate_hand(dealer_cards)
  display_opening(player_cards, dealer_cards)
  loop do
    player_answer = ask_player
    player_turn(player_answer, player_cards)
    break if busted?(player_cards) || MOVES[1].include?(player_answer)
  end
  player_busts_or_stays(player_cards)

  until busted?(dealer_cards) || dealer_reach_max?(dealer_cards)
    break if busted?(player_cards)
    dealer_turn(dealer_cards)
    dealer_busts_or_stays(dealer_cards)
  end

  display_hand(player_cards, dealer_cards)
  display_result(player_cards, dealer_cards)

  win?(player_cards, dealer_cards) 
  win?(dealer_cards, player_cards)
  player_score = update_score(player_cards, dealer_cards, player_score)
  dealer_score = update_score(dealer_cards, player_cards, dealer_score)

  display_score(player_score, dealer_score)

  if tournament_max_reached?(player_score, dealer_score)
    prompt "#{TOURNAMENT_MAX} wins. Game over."
    gameplay_answer = ''
    loop do
      gameplay_answer = play_again
      break if PLAY_AGAIN_MOVES.include?(gameplay_answer)
    end
    player_score = 0
    dealer_score = 0
    break if gameplay_answer == PLAY_AGAIN_MOVES[1]
  end
  start_new_round
  system "clear"
end
goodbye
