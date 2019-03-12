CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock' }


def valid(returned_val)
 if CHOICES.to_a.flatten.include?(returned_val)
  puts "true"
else
  puts "false"
end
end
valid("chai")
valid("r")
valid("paper")