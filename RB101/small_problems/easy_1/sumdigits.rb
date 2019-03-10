# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# problem
# need the sum of a integer split into two - so it has to be a digit greater than 9
# split the number 
# add the numbers
#input
# number - positive integer
# output
# sum of its digits
# exampes / test code 
# tetsed - converting to string and then back to integer 

def sum(num)
  newnum = num.to_s.split('')
  total = newnum.map { |e| e.to_i}.sum
  puts total
end
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45