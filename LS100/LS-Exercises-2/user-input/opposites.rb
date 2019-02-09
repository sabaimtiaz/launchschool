

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num1 = nil
num2 = nil

def read_number
  puts "Please enter a positive or negative integer"
  num1 = gets.chomp.to_i
  #puts num1
  puts "Please enter a positive or negative integer"
  num2 = gets.chomp.to_i
  #puts num2"
  if num1 > 0 || num2 > 0
  puts "Please enter one negative number"
end
e

loop do
  sum = num1 + num2
  puts "#{num1} + #{num2} = #{sum}"
  break
end
end