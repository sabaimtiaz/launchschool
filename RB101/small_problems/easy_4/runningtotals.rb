
# Write a method that takes an Array of numbers
# and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.
def running_total(array)
   sum = 0
  # p array.map { |value| sum+=value}
  p array.each_with_object([]) {|i, a| a << sum +=i}
end
running_total([2, 5, 13])
running_total([14, 11, 7, 15, 20]) 
running_total([3]) 
running_total([]) 