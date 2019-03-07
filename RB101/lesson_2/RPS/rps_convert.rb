
CHOICES = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock'}
# loop do
puts 'Choose rock, paper, scissors, lizard, or Spock. You can also enter the returned_val letter'
input = gets.chomp
puts "You chose #{input}."

# computer generates a choice

computer_choice = CHOICES.values.sample
puts "The computer chose #{computer_choice}."

#combining validity and equality

  if CHOICES.has_key?(input) || CHOICES.has_value?(input) || input == "sp"
    puts 'Processing..'
   #break
  else
    puts "This is invalid input. Try again."
  end


if input == computer_choice || input == computer_choice[0] || input == "sp" && computer_choice == "Spock"
  puts 'Its a tie. Try again.'
end

#end - commenting out loop while we do conversion

def convert(input)
  if input.size <= 1
    if CHOICES.to_a.flatten.include?(input)
      return CHOICES[input]
    end
  elsif input == "sp"
      return CHOICES['sp']
  end
end

returned_val = convert(input)

# conditions
# paper && rock
# def choices(returned_val, computer_choice)
 # if returned_val.start_with?('p') && computer_choice.start_with?('r')
  # puts "#{returned_val} beats #{computer_choice}"
  # end
# end
# choices(returned_val, computer_choice)

def win?(returned_val, computer_choice)
  (returned_val == "paper" && computer_choice == "rock") ||
  (returned_val == "paper" && computer_choice =="Spock") ||
  (returned_val == "rock" && computer_choice == "lizard") || 
  (returned_val == "rock" && computer_choice == "scissors") ||
  (returned_val == "scissors" && computer_choice == "paper") ||
  (returned_val == "lizard" && computer_choice == "paper") ||
  (returned_val = "lizard" && computer_choice == "Spock") ||
  (returned_val == "Spock" && computer_choice == "scissors") || 
  (returned_val == "Spock" && computer_choice == "rock") 
end

if win?(returned_val, computer_choice)
  puts "you win"
end
# logic check the conditions b/w input and computer choice
# but also do conversion of inpuit returned_val and then test






