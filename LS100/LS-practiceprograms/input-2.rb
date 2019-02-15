puts "What is your name?"
name = gets.chomp
puts name
puts "How old are you?"
age = gets.chomp.to_i
puts age
currentyear = 2019
year = currentyear - age
puts "#{name} was born in #{year}"