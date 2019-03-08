CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock' }
input = ''
player_score = 0
computer_score = 0

loop do
  puts "Welcome to Rock Paper Scissors Spock Lizard!"
  CHOICES.each { |key, value| puts "Enter #{value} or #{key} for #{value}" }

  # puts 'Choose rock, paper, scissors, lizard, or Spock.'
  input = gets.chomp
  puts "You chose #{input}."

  # computer generates a choice

  computer_choice = CHOICES.values.sample
  puts "The computer chose #{computer_choice}."

  def convert(input)
    if input.size <= 1
      if CHOICES.to_a.flatten.include?(input)
        return CHOICES[input]
      elsif input == "sp"
        return CHOICES['sp']
      end
    end
  end

  returned_val = convert(input)

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
      puts "you win"
    elsif win?(computer_choice, returned_val)
      puts "you lose"
    end
  end
 
 
  # combining validity and equality

  if CHOICES.key?(input) || CHOICES.value?(input) || input == "sp"
    puts 'Processing..'
  elsif puts "This is invalid input. Try again."
  end

  if input == computer_choice || input == computer_choice[0] || input == "sp" && computer_choice == "Spock"
    puts 'Its a tie. Try again.'
  end

  display_results(returned_val, computer_choice)


  if win?(returned_val, computer_choice)
    player_score +=1
    puts "You scored #{player_score}"
    if player_score == 5
      puts "You have 5 wins!"
      break
    end
    elsif win?(computer_choice, returned_val)
      computer_score +=1
      puts "The computer scored #{computer_score}"
      if computer_score == 5
        puts "The computer has 5 wins!"
        break
      end
  end

  puts 'Do you want to play again?'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # commenting out loop while we do conversion
puts 'Thank you for playing. Goodbye!'

# paper && rock
# def choices(returned_val, computer_choice)
# if returned_val.start_with?('p') && computer_choice.start_with?('r')
# puts "#{returned_val} beats #{computer_choice}"
# end
# end
# choices(returned_val, computer_choice)

# logic check the conditions b/w input and computer choice
# but also do conversion of inpuit returned_val and then test
