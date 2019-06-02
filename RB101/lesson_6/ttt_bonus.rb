require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = '0'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end


def joinor(arr, delimiter = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "       |       |"
  puts "    #{brd[1]}  |  #{brd[2]}    | #{brd[3]}"
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  # create a new keyvalue pair in a hash
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd) # method that is going to modify this board
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

# 3 defense 
def computer_places_piece!(brd)
  # square = nil

# offense
  if square !=nil
    WINNING_LINES.each do |line|
      square = detect_risk(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

# defense
  WINNING_LINES.each do |line|
    square = detect_risk(line, brd, PLAYER_MARKER)
    break if square
  end

# pick square 5
  if !square
   square = brd[5]
  end
  brd[square] = COMPUTER_MARKER

# pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def detect_risk(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{ |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end
# ends defense  
def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

board = initialize_board
display_board(board)

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

player_score = 0
computer_score = 0

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
  
  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

#2 scoring
  if detect_winner(board) == 'Player'
   player_score = player_score + 1
   player_score
  elsif detect_winner(board) == 'Computer'
    computer_score = computer_score + 1
    computer_score
  break if player_score == 5 || computer_score == 5
 end

  puts "The player's score is #{player_score}"
  puts "The computer's score is #{computer_score}"
  
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y') 
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
