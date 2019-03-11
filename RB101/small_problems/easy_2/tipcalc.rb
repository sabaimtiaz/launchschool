# problem
# Create a simple tip calculator. 
# input:
# The program should prompt for a bill amount and a tip rate. 
#  display both the tip and the total amount of the bill.
# test
# data
# to prompt
# code
# tip rate calculations = multiply
# # The program must compute the tip 

puts 'Welcome to the tip calculator'
puts 'What is the amount of the bill?'
bill = gets.chomp.to_f
puts 'What is the tip rate?'
rate = gets.chomp.to_f
tip = (bill*rate/100).round(2)
total_bill = (bill + tip).round(2)
puts "The tip is $#{tip} and your total bill is $#{total_bill}."
