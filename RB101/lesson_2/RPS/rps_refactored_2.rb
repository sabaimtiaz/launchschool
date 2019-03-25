CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors',
            'l' => 'lizard', 'sp' => 'Spock' }
WINS = { 'rock' => ['lizard', 'scissors'], 'paper' => ['rock', 'Spock'],
         'scissors' => ['paper', 'lizard'], 'lizard' => ['paper', 'Spock'],
         'Spock' => ['paper', 'scissors'] }
player_score = 0
computer_score = 0
input = ''

def prompt(message)
  Kernel.puts("=>#{message}")
end

def convert_choice(input)
  if input.size <= 1
    if CHOICES.to_a.flatten.include?(input)
      CHOICES[input]
    end
  elsif input == "sp"
    CHOICES['sp']
  elsif input.size > 1
    input
  end
end

def determine_winner?(player, computer)
  WINS[player].include?(computer)
end

def display_results(returned_val, computer_choice)
  if determine_winner?(returned_val, computer_choice)
    prompt('You win!')
  elsif determine_winner?(computer_choice, returned_val)
    prompt('You lose!')
  elsif returned_val == computer_choice
    puts "It's a tie."
  end
end

loop do
  puts "Welcome to Rock Paper Scissors Spock Lizard!"
  CHOICES.each { |key, value| puts "Enter #{value} or #{key} for #{value}" }
  input = gets.chomp
  returned_val = convert_choice(input)

  system('clear')
    if CHOICES.to_a.flatten.include?(input)
    prompt("You chose #{returned_val}.")
  else
    puts "This is invalid."
    break
  end

  computer_choice = CHOICES.values.sample
  prompt("The computer chose #{computer_choice}.")

  display_results(returned_val, computer_choice)

  if determine_winner?(returned_val, computer_choice)
    player_score += 1
    prompt("You scored 1.")
  elsif determine_winner?(computer_choice, returned_val)
    computer_score += 1
    prompt("The computer scored 1.")
  end

  determine_winner?(returned_val, computer_choice)
  prompt("Your total score is #{player_score}.")
  prompt("The computer's score is #{computer_score}.")

  if player_score == 5 || computer_score == 5
    prompt("5 wins! Game over!")
    break
  end
  prompt('Do you want to play again? Enter y or any other key to exit:')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  system('clear')
end
prompt('Thank you for playing. Live long and prosper!')
