# rps_input.rb
# problem - ask the user to input a choice from a data structure

CHOICES = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'Spock'}

loop do
  puts 'Choose rock, paper, scissors, lizard, or Spock. You can also enter the first letter'
  input = gets.chomp

   puts "You chose #{input}."

   computer_choice = CHOICES.to_a.flatten.sample
   puts "The computer chose #{computer_choice}."

# validate input
# we check that the input is valid - that it matches the list of choices
# validate the input
# validate the letters and "convert" the letters into their associated strings

# step 1
# validate input
# validation using if/else statement with the set choices


# can you invoke this as a method?
# yes, but cannot also run it as a loop. lets run it as a loop w/o the method.
  
#def method(input)
  if CHOICES.has_key?(input) || CHOICES.has_value?(input)
    puts "This is valid input"
    break
  else
    puts "This is invalid input. Try again."
     end
end


#method(input)

