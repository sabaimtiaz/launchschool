class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
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

  def winning_marker # return winning marker or return nil
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
    return false if markers.size != 2
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
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  CHOICES = ["player", "computer", "random"]

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = " "
  end

  def play
    clear
    display_welcome_message
    choose_player
    main_game
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts "Choose who goes first."
    puts "Your choices are: #{CHOICES.each { |choice| choice }.join(', ')}"
  end

  def choose_player
    choice = ''
    loop do
      choice = gets.chomp.to_s
      break if CHOICES.include?(choice)
      puts "Sorry, that's not a valid answer"
    end

    case choice
    when "player"
      @current_marker = HUMAN_MARKER
      puts "You're going first!"
    when "computer"
      @current_marker = COMPUTER_MARKER
      puts "The computer plays first!"
    when "random"
      @current_marker = [HUMAN_MARKER, COMPUTER_MARKER].sample
      puts "We chose for you!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
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
      board[board.find_at_risk_square.select { |e| board.marked_keys.include?(e) }[0]] = computer.marker
    elsif board.find_at_risk_square.size == 3
      board[board.find_at_risk_square.select { |e| !board.marked_keys.include?(e) }[0]] = computer.marker
    elsif board.unmarked_keys.include?(5)
      board[board.unmarked_keys.select { |e| e == 5 }[0]] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
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

  # def display_result
  #   clear_screen_and_display_board

  #   case board.winning_marker
  #   when human.marker
  #     puts "You won!"
  #   when computer.marker
  #     puts "Computer won!"
  #   else
  #     puts "It's a tie!"
  #   end
  # end

  def display_result
    clear_screen_and_display_board
    if human_won?
      puts "You won!"
    elsif computer_won?
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score(human_score, comp_score)
    puts "Your score is #{human_score}"
    puts "The computer's score is #{comp_score}"
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
      display_score(human_score, computer_score)
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
