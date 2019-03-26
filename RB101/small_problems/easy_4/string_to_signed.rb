# Write a method that takes a String of digits,
#  and returns the appropriate number as an integer. 
#The String may have a leading + or - sign; 

# rules:
# if the first character is a +, your method should return a positive number; 
# if it is a -, your method should return a negative number. 
# If no sign is given, you should return a positive number.
# You may assume the string will always contain a valid number.

# problem
# return a string of digits as an integer, including the sign
# "convert" string without using any of the usual methods
# delete symbol and add it on later


DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
  '6' => 6, '7' => 7, '8'=> 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15}

def string_to_integer(string)
  if string.include?('-')
    string.slice!('-')
    digits = string.chars.map { |char| DIGITS[char] }
    value = 0
    digits.each { |digit| value = 10 * value + digit}
    value * -1
  elsif string.include?('+')
    string.slice!('+')
    digits = string.chars.map { |char| DIGITS[char] }
    value = 0
    digits.each { |digit| value = 10 * value + digit}
    value * 1
  else
    digits = string.chars.map { |char| DIGITS[char] }
    value = 0
    digits.each { |digit| value = 10 * value + digit}
    value
  end
end
p string_to_integer("4321")
p string_to_integer('-570')
p string_to_integer('+100')
