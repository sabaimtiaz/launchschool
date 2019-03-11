# problem - generate a rand number b/w 20 and 100
age = rand(20..200)
puts "Teddy is #{age} years old!"

# modified
puts 'Enter a name'
name = gets.chomp
age = rand(20..200)
name = "Teddy" if name.empty?
puts "#{name}'s age is #{age}!"
