# variable initialisation
name = ''

# user input and validation
puts "Enter your name: "
loop do
  name = gets.chomp
  break unless name.empty?
  puts "That's an invalid name. Try again."
end

# using the variable
puts "Welcome #{name}"
puts "What would you like to do?"

