require 'pry'

class Player
  attr_accessor :marker

  def initialize
    @marker = marker
    @@game_markers = ["X", "O"]
  end
end

class Human < Player
  attr_accessor :name

  def initialize
    super
    @name = name
  end

  def choose_marker
    marker_choice = ''
    loop do
      marker_choice = gets.chomp.to_s.upcase
      break if @@game_markers.include?(marker_choice)
      puts "Sorry, that's not a valid marker!"
    end
    @marker = marker_choice
    @@game_markers.delete(marker_choice)
  end

  def enter_name
    player_name = ''
    loop do
      puts "Enter your name:"
      player_name = gets.chomp
      break if player_name.scan(/[^a-zA-Z]/).empty?
      puts "Sorry, no numbers or characters allowed!"
    end
    @name = player_name
  end
end

class Computer < Player
  attr_accessor :name

  def initialize
    super
    @name = "Robot"
  end

  def choose_marker
    @marker = @@game_markers[0]
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def marked_keys
    @squares.keys.select { |key| @squares[key].marked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def find_at_risk_square
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares)
        return line
      end
    end
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def two_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 2 && !markers.uniq.empty?
    markers.uniq.size == 1
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class TTTGame
  CHOICES = ["player", "computer", "random"]
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    clear
    display_welcome_message
    display_marker_message
    select_marker
    choose_player
    enter_player_name
    main_game
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_choose_player_message
    puts "Choose who goes first."
    puts "Your choices are: #{CHOICES.each { |e| }.join(', ')}"
  end

  def display_marker_message
    puts "Choose a marker! Your choices are: X or O."
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "#{human.name} is #{human.marker}."
    puts "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def choose_player
    player_choice = nil
    loop do
      display_choose_player_message
      player_choice = gets.chomp.to_s
      break if CHOICES.include?(player_choice)
      puts "Sorry, that's not a valid answer"
    end

    case player_choice
    when "player"
      @current_marker = human.marker
      puts "You're going first!"
    when "computer"
      @current_marker = computer.marker
      puts "#{computer.name} plays first!"
    when CHOICES[2]
      @current_marker = [human.marker, computer.marker].sample
      puts "We chose for you!"
    end
  end

  def enter_player_name
    human.enter_name
  end

  def select_marker
    human.choose_marker
    computer.choose_marker
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(array, punct = ', ', joiner='or')
    case array.size
    when 0 then ''
    when 1 then array.first
    when 2 then array.join(" #{joiner} ")
    else
      array[-1] = "#{joiner} #{array.last}"
      array.join(punct)
    end
  end

  def human_moves
    puts "Choose a square"
    puts joinor(board.unmarked_keys)
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    if board.find_at_risk_square.size == 2
      board[board.find_at_risk_square] << computer.marker
    elsif board.find_at_risk_square.size == 3
      board[board.find_at_risk_square.select { |e| !board.marked_keys.include?(e) }[0]] = computer.marker
    elsif board.unmarked_keys.include?(5)
      board[board.unmarked_keys.select { |e| e == 5 }[0]] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.full? || board.someone_won?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_won?
    case board.winning_marker
    when human.marker
      true
    end
  end

  def computer_won?
    case board.winning_marker
    when computer.marker
      true
    end
  end

  def display_result
    clear_screen_and_display_board
    if human_won?
      puts "#{human.name} won!"
    elsif computer_won?
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def main_game
    human_score = 0
    computer_score = 0
    loop do
      display_board
      player_move
      display_result
      human_score += 1 if human_won?
      computer_score += 1 if computer_won?
      if human_score == 5 || computer_score == 5
        puts "Max score reached!"
        human_score = 0
        computer_score = 0
      end
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = " "
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts " "
  end
end

game = TTTGame.new
game.play
