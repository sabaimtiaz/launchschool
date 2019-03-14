# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power.
# Do not worry about validating the input.

# test
# a = 5
# b = 6
# puts a*b
# puts a+b
# puts a-b
# puts a/b
# puts a%b

def prompt(message)
  puts "==> #{message}"
end

loop do
  prompt('Enter the first number')
  num1 = gets.chomp.to_i
  prompt('Enter the second number')
  num2 = gets.chomp.to_i
  if num2 <= 0
    puts "This is not valid"
    next
  end
  prompt("#{num1} + #{num2} = #{num1 + num2}")
  prompt("#{num1} - #{num2} = #{num1 - num2}")
  prompt("#{num1} * #{num2} = #{num1 * num2}")
  prompt("#{num1} / #{num2} = #{num1 / num2}")
  prompt("#{num1} % #{num2} = #{num1 % num2}")
  prompt("#{num1} ** #{num2} = #{num1**num2}")
end
