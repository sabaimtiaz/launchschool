# rps_input.rb
# problem - ask the user to input a choice from a data structure

choices = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock'}
puts 'Choose rock, paper, scissors, lizard, or Spock. You can also enter the first letter'
input = gets.chomp
puts "You chose #{input}."

# computer generates a choice

computer_choice = choices.to_a.flatten.sample
puts "The computer chose #{computer_choice}."

