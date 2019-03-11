# problem
# input
# length and width of a room in meters
# output
# area of the room in square meters and square feet

puts 'Enter the length of the room in meters'
length = gets.chomp.to_f
puts 'Enter the width of the room in meters'
width = gets.chomp.to_f
area = (length * width).round(2)
sqfeet = 10.7639
area_sqfeet = (area * sqfeet).round(2)
puts "The area of the room is #{area} square meters (#{area_sqfeet} square feet)."

