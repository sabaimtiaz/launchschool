CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock' }
input = ''
player_score = 0
computer_score = 0
rounds = 0

def prompt(message) # need a generic prompt method to format output
  Kernel.puts("=>#{message}")
end

loop do
  puts "Welcome to Rock Paper Scissors Spock Lizard!"
  CHOICES.each { |key, value| puts "Enter #{value} or #{key} for #{value}" }
  # puts 'Choose rock, paper, scissors, lizard, or Spock.'
  input = gets.chomp

  def convert(input)
    if input.size <= 1
      if CHOICES.to_a.flatten.include?(input)
        return CHOICES[input]
      end
    end

    if input == "sp"
      return CHOICES['sp']
    elsif input.size > 1
      return input
    end
  end

  returned_val = convert(input)
  puts "You chose #{returned_val}"
  # computer generates a choice
  computer_choice = CHOICES.values.sample
  prompt("The computer chose #{computer_choice}.")

  def win?(returned_val, computer_choice)
    (returned_val == "paper" && computer_choice == "rock") ||
    (returned_val == "paper" && computer_choice =="Spock") ||
    (returned_val == "rock" && computer_choice == "lizard") ||
    (returned_val == "rock" && computer_choice == "scissors") ||
    (returned_val == "scissors" && computer_choice == "paper") ||
    (returned_val == "scissors" && computer_choice == "lizard") ||
    (returned_val == "lizard" && computer_choice == "paper") ||
    (returned_val == "lizard" && computer_choice == "Spock") ||
    (returned_val == "Spock" && computer_choice == "scissors") ||
    (returned_val == "Spock" && computer_choice == "rock")
  end

  def display_results(returned_val, computer_choice)
    if win?(returned_val, computer_choice)
      prompt('You win!')
    elsif win?(computer_choice, returned_val)
      prompt('You lose!')
    end
  end
  # combining validity and equality
  if CHOICES.key?(input) || CHOICES.value?(input) || input == "sp"
    prompt('Processing..')
  elsif prompt('This is an incorrect choice. Try again.')
  end

  if input == computer_choice || input == computer_choice[0] || input == "sp" && computer_choice == "Spock"
    prompt('Its a tie. Try again.')
  end

  display_results(returned_val, computer_choice)

  if win?(returned_val, computer_choice)
    player_score += 1
    prompt("You scored 1.")
    if player_score == 5
      prompt('You have 5 wins!')
      break
    end
  elsif win?(computer_choice, returned_val)
    computer_score += 1
    prompt("The computer scored 1.")
    if computer_score == 5
      prompt('The computer has 5 wins!')
      break
    end
  end

  prompt("Your total score is #{player_score} and the computer score is #{computer_score}")

  rounds += 1
  puts "You are on round #{rounds}"

  prompt('Do you want to play again? Enter y or any other key to exit:')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  system('clear')
end # commenting out loop while we do conversion
prompt('Thank you for playing. Live long and prosper!')
system('clear')

# paper && rock
# def choices(returned_val, computer_choice)
# if returned_val.start_with?('p') && computer_choice.start_with?('r')
# puts "#{returned_val} beats #{computer_choice}"
# end
# end
# choices(returned_val, computer_choice)

# logic check the conditions b/w input and computer choice
# but also do conversion of inpuit returned_val and then test
