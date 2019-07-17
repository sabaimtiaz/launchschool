
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = '0'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

RISK_LINES =    [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]] +
                [[2, 3, 1], [5, 6, 4], [8, 9, 7]] +
                [[4, 7, 1], [5, 8, 2], [6, 9, 3]] +
                [[5, 9, 1], [5, 7, 3]] +
                [[3, 5, 7], [7, 5, 3]]

FIRST_MOVE = ["Player", "Computer", "Choose"]
CHOICES = ["Player", "Computer"]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "       |       |"
  puts "   #{brd[1]}   |  #{brd[2]}    | #{brd[3]}"
  puts "       |       |"
  puts "-------+-------+------"
  puts "       |       |"
  puts "   #{brd[4]}   |  #{brd[5]}    | #{brd[6]}"
  puts "       |       |"
  puts "-------+-------+------"
  puts "       |       |"
  puts "   #{brd[7]}   |  #{brd[8]}    | #{brd[9]}"
  puts "       |       |"
  puts ""
end

def joinor(array)
  if array.empty?
    array
  elsif array.size == 1
    array[0]
  elsif array.size == 2
    "#{array[0]} or #{array[1]}"
  elsif array.size >= 3
    array_remaining = array[0..-2].join(', ')
    "#{array_remaining}, or #{array[-1]}"
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == "Player"
    player_places_piece!(brd)
  elsif current_player == "Computer"
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == "Player"
    "Computer"
  elsif current_player == "Computer"
    "Player"
  end
end

def detect_risk_location(brd)
  RISK_LINES.each do |line|
    first_val = brd[line[0]]
    second_val = brd[line[1]]
    third_val = brd[line[2]]
    if first_val == "X" && second_val == "X" && third_val == " "
      return line[2]
    end
    return nil
  end
end

def detect_computer_win(brd)
  RISK_LINES.each do |line|
    first_val = brd[line[0]]
    second_val = brd[line[1]]
    third_val = brd[line[2]]
    if first_val == "O" && second_val == "O" && third_val == " "
      return line[2]
    end
    return nil
  end
end

def computer_places_piece!(brd)
  if !detect_computer_win(brd).nil?
    brd[detect_computer_win(brd)] = COMPUTER_MARKER
  elsif !detect_risk_location(brd).nil?
    brd[detect_risk_location(brd)] = COMPUTER_MARKER
  elsif brd[5] == " "
    brd[5] = COMPUTER_MARKER
  else
    brd[empty_squares(brd).sample] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

board = initialize_board
display_board(board)

player_score = 0
computer_score = 0

loop do
  board = initialize_board
  choice = nil
  current_player = nil

  loop do
    prompt "Pick a choice from #{FIRST_MOVE}"
    choice = gets.chomp
    break if FIRST_MOVE.include?(choice)
    prompt "That is an invalid choice. Choose again."
  end

  if choice == "Choose"
    choice = CHOICES.sample
  end

  current_player = choice

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  if detect_winner(board) == 'Player'
    player_score += 1
  elsif detect_winner(board) == 'Computer'
    computer_score += 1
    computer_score
  end

  if player_score == 5 || computer_score == 5
    break
  end

  prompt "The player's score is #{player_score}"
  prompt "The computer's score is #{computer_score}"

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
