# problem
# Write a method that takes a positive integer or zero, 
# and converts it to a string representation

# rules
# no standard conversion method

# test case
# 4321 = "4321"

# new_arr = [] 
# new_arr = 4321.digits.reverse.join
# p new_arr
#new_arr.map.with_index { |e, i| puts e }

def integer_to_string(num)
  num.digits.reverse.join
end
p integer_to_string(4321) 
p integer_to_string(0) 
p integer_to_string(5000)