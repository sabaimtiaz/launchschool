# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. 
# The ASCII string value is the sum of the ASCII values of every character in the string. 
# (You may use String#ord to determine the ASCII value of a character.)

# problem
# input = takes string as argument
# ASCII value of every character
# output = returns sum of ASCII values

def ascii_value(string)
  new_arr = []
  new_arr = string.chars 
  sum = 0
  new_arr.map { |chars| sum += chars.ord}
  p sum
end
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
ascii_value("coffee")