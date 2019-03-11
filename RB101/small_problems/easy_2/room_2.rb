
SQFEET_TO_SQCM = 929
SQFEET_TO_SQIN = 144

puts 'Enter the length of the room in feet'
length = gets.chomp.to_f
puts 'Enter the width of the room in feet'
width = gets.chomp.to_f
sqfeet = (length * width).round(2)
sqin = (sqfeet * SQFEET_TO_SQIN).round(2)
sqcm = (sqfeet * SQFEET_TO_SQCM).round(2)
puts "The area in square feet is #{sqfeet}, in inches is #{sqin} and in centimeters is #{sqcm}"
