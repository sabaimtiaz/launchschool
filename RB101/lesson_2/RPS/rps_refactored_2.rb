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
  winner = determine_winner?(returned_val, computer_choice)
  if returned_val == computer_choice
    prompt("It's a tie")
  elsif winner == true
    prompt('You win!')
  else
    prompt('You lose!')
  end
end

def valid_choice?(choice)
  CHOICES.to_a.flatten.include?(choice)
end

puts "Welcome to Rock Paper Scissors Spock Lizard!"
puts "Win five games against the computer to become the champion!"
puts "OR... you can just play one round."
puts "---------------------------------"

loop do
  input = ''

  loop do
    CHOICES.each { |key, value| puts "Enter #{value} or #{key} for #{value}" }
    input = gets.chomp
    if valid_choice?(input)
      break
    else
      prompt('This is invalid.')
    end
  end

  returned_val = convert_choice(input)
  computer_choice = CHOICES.values.sample
  prompt("You chose #{returned_val}.")
  prompt("The computer chose #{computer_choice}.")

  winner = determine_winner?(returned_val, computer_choice)

  display_results(returned_val, computer_choice)
  puts "-------------------------------------"
  if winner == true
    player_score += 1
    prompt("You scored 1.")
  elsif winner == false
    computer_score += 1
    prompt("The computer scored 1.")
  end

  prompt("Your total score is #{player_score}.")
  prompt("The computer's score is #{computer_score}.")

  if player_score == 5 || computer_score == 5
    puts "-------------------------------------"
    prompt("5 wins! Game over!")
    break
  end

  Kernel.sleep(1)

  puts "-----------------------------------------"
  prompt('Do you want to play again?')
  prompt('Enter y to continue. Press any other key to exit:')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  system('clear')
end

prompt('Thank you for playing. Live long and prosper!')
