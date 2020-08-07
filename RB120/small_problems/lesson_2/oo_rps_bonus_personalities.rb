module Choosy
  def choose_scissors
   ["scissors", "scissors", "scissors", "paper"].sample
  end

  def choose_rock
    'rock'
  end
end

class Move
  include Choosy
  VALUES = ["rock", "paper", "scissors", "lizard", "spock"]
  attr_accessor :score
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
    (paper? && other_move.rock?) ||
    (scissors? && other_move.paper?) ||
    (lizard? && other_move.paper?) ||
    (lizard? && other_move.spock?) ||
    (spock? && other_move.rock?) ||
    (rock? && other_move.lizard?) ||
    (scissors? && other_move.lizard?) ||
    (spock? && other_move.scissors?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
    (paper? && other_move.scissors?) ||
    (scissors? && other_move.rock?) ||
    (spock? && other_move.lizard?) ||
    (lizard? && other_move.rock?) ||
    (lizard? && other_move.scissors?) ||
    (paper? && other_move.lizard?) ||
    (scissors? && other_move.spock?) ||
    (rock? && other_move.spock?)
  end

  def to_s
    @value
  end
end

class Player
  include Choosy
  attr_accessor :move, :name, :score, :moves

  def initialize
    set_name
    @score = 0
    @moves = []
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or Spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    moves << self.move
  end
end

class Computer < Player
  include Choosy
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    if self.name == "R2D2"
      self.move = Move.new(self.choose_rock)
    elsif moves.count("scissors") < 5 && self.name == "Hal"
      self.move = Move.new(self.choose_scissors)
    else
      self.move = Move.new(Move::VALUES.sample)
    end
   moves << self.move
  end

end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard or Spock!"
    puts "You're playing against #{computer.name}"
  end

  def display_current_move
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_score
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
    puts "#{human.name} scored #{human.score}"
    puts "#{computer.name} scored #{computer.score}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_all_moves
    puts "#{human.name} has made the following moves:"
    human.moves.each { |move| puts "- #{move}" }
    puts ""
    puts "#{computer.name} has made the following moves:"
    computer.moves.each { |move| puts "- #{move}" }
  end

  def max_score?
    human.score == 2 || computer.score == 2
  end

  def reset_game
    human.score = 0 && computer.score = 0
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == "n"
    return true if answer.downcase == "y"
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_current_move
      display_winner
      display_all_moves
      display_score
      if max_score?
        puts "The maximum score was reached!"
        if play_again?
          reset_game
          next
        else
          break
        end
      end
      break unless play_again? 
    end
    display_goodbye_message
  end
end

RPSGame.new.play
