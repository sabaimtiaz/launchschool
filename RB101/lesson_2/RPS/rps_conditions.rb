


CHOICES = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock'}
#loop do
  puts 'Choose rock, paper, scissors, lizard, or Spock. You can also enter the first letter'
input = gets.chomp
puts "You chose #{input}."

# computer generates a choice

computer_choice = CHOICES.to_a.flatten.sample
puts "The computer chose #{computer_choice}."

# conditions
paper && rock
rock && scissors
rock && lizard
scissors && paper
lizard && Spock
lizard && paper
Spock && rock
Spock && scissors


# p and r
# r and s
# r and l
# s and p
# l and Sp
# l and p
# Sp snd s
