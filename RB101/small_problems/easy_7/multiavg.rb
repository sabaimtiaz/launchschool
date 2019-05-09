# Write a method that takes an Array of integers as input
# multiplies all the numbers together
# divides the result by the number of entries in the Array, 
# and then prints the result rounded to 3 decimal places. 
# Assume the array is non-empty.

def multi_avg(array)
  product = 1.to_f
  for num in array
    product *= num
  end
  average = product / array.size
  average = format('%.3f', average)
  p "The result is #{average}"
end
multi_avg([3, 5])
multi_avg([6])
multi_avg([2, 5, 7, 11, 13, 17])