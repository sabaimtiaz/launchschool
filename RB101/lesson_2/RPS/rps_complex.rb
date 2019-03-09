CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock' }
GAME_CHOICES = {'paper' => ["rock"]}
choice2 = {'rock' => %w["scissors" "lizard"]}
choice3 = {'scissors' => ["paper"]}
choice4 = {'lizard' => ["Spock", "paper"]}
choice5 = {'Spock' => ["rock", "scissors"]}

comp_choice = choice2.values.sample
puts comp_choice
puts "make a choice"

answer = gets.chomp
if GAME_CHOICES.keys.include?(answer) && GAME_CHOICES.values.include?(comp_choice)
  puts "answer beats comp choice"
end

if choice2.keys.include?(answer) && choice2.values.include?(comp_choice)
  puts "answer beats comp choice"
end