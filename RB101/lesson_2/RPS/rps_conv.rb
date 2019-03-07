
CHOICES = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock'}

puts 'Choose rock, paper, scissors, lizard, or Spock. You can also enter the first letter'
input = gets.chomp
puts "You chose #{input}."

puts CHOICES[input]