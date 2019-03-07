
# we check that the input and the computer choice is not equal - if its a tie we end the program


CHOICES = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock'}
loop do
  puts 'Choose rock, paper, scissors, lizard, or Spock. You can also enter the first letter'
input = gets.chomp
puts "You chose #{input}."

# computer generates a choice

computer_choice = CHOICES.to_a.flatten.sample
puts "The computer chose #{computer_choice}."

#combining validity and equality

if input == computer_choice || input == computer_choice[0]
  puts 'It is a tie. Try again.'
  next
end

  if CHOICES.has_key?(input) || CHOICES.has_value?(input)
    puts "This is valid input"
    break
  else
    puts "This is invalid input. Try again."
  end
end

